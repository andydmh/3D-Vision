function pano = hw3_helper(directory)

% Loads all the images on the directory. It assumes alphabetical order
% is equivalent to frame order
images = load_images(directory);

disp('Loaded Images Dimensions: ');
disp(size(images));
% Getting total number of frames
s = size(images);
numb_images = s(4);

% Homographies between pairs of frames
threshold = 0.01;
for i = 1:numb_images-1
    H_matrix{i} = homography(images(:,:,:,i), images(:,:,:,i+1), threshold);
end

disp('H matrix dimensions: ')
disp(size(H_matrix));
disp(H_matrix);

% Homographies between each frame starting on last frame. Carrying last
% imformation starting from last frame.
H_matrix{numb_images-1} = transpose(H_matrix{numb_images-1});
for i = numb_images-2:-1:1
    H_matrix{i} = H_matrix{i+1} * transpose(H_matrix{i});
end

% Getting dimensions of center image
center_img_dim = size(images(:,:,:,round(numb_images/2)));

% Creating transformations based on homographies
transf{numb_images} = projective2d(eye(3));
for i = 1:numb_images-1
    transf{i} = projective2d(H_matrix{i});
end

% Finding dimensions on the x and y axis
for i = 1:numb_images-1
    [x_limit(i,:), y_limit(i,:)] = outputLimits(transf{i}, [1, center_img_dim(2)], [1, center_img_dim(1)]);
end

min_x = min([1; x_limit(:)]);
min_y = min([1; y_limit(:)]);
max_x = max([center_img_dim(2); x_limit(:)]);
max_y = max([center_img_dim(1); y_limit(:)]);

limits_x = [min_x, max_x];
limits_y = [min_y, max_y];

width = round(max_x - min_x);
height = round(max_y - min_y);

% Creating pano and blend approach
pano = zeros([height, width, 3], 'like', images(:,:,:,3));
blend = vision.AlphaBlender('Operation', 'Binary mask', 'MaskSource', 'Input port');

% Creating panorama image by puting together each image with its
% transformation on the same frame.
pano_view = imref2d([height, width], limits_x, limits_y);
for i = 1:numb_images-1
    pano = create_panorama(pano, images(:,:,:,i), transf{i}, blend, pano_view);
end
pano = create_panorama(pano, images(:,:,:,numb_images), transf{numb_images}, blend, pano_view);

end
% This function adds a new image to the panorama image and returns the new
% panorama.
function panorama = create_panorama(panorama_prev, I, transform, blender, pano_view)
    warp_image = imwarp(I, transform, 'OutputView', pano_view);
    mask = imwarp(true(size(I,1), size(I,2)), transform, 'OutputView', pano_view);
    panorama = step(blender, panorama_prev, warp_image, mask);
end
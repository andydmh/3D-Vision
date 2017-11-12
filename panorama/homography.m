 function rh = homography(cur_img, next_img, threshold)
    % Reading the current and next frame.
    cur_img = rgb2gray(cur_img);
    next_img = rgb2gray(next_img);
    
    % Getting SIFT features
    [feature_vector_c, descriptor_c] = vl_sift(cur_img);
    [feature_vector_n, descriptor_n] = vl_sift(next_img);
    
    % Matching features
    [match_values, scores] = vl_ubcmatch(descriptor_c, descriptor_n);
    
    fc = feature_vector_c(1:2, match_values(1,:));
    fn = feature_vector_n(1:2, match_values(2,:));
    [rh, Inliners] = ransacfithomography(fc, fn, threshold);
end
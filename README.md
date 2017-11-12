# 3D-Vision

## Panorama

Description:
The objective is to build a panoramic image given a list of consecutive overlaping frames. The method find matches between SIFT descriptors of pairs consecutive images. It also uses RANSAC to construct the homography matrix between the 2 consecutive frames. Then all the frames are projected into the same image by using their respective transformation and blended together to create the final panoramic image.

For more information check this [description file](https://github.com/andydmh/3D-Vision/blob/master/panorama/Documents/3D%20Vision%20HW%203.pdf)

Input: modify the variable directories inside the hw3.m file to include any directory with images from which you want to build a panoramic image. Use as an example the current directories and images available.

Output: A panoramic image with the same name of the directory followed by _pano.jpg.

Examples:

![Guitar Example](https://github.com/andydmh/3D-Vision/blob/master/panorama/Documents/guitar_sample.png)



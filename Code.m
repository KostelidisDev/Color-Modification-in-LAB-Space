% Clear Workspace
close all;
clear;
clc;

% User Configurable Variables
%input_image_file = 'peppers.png';
input_image_file = 'Demo.jpg';
target_image_height = 500;

% Main Script
input_image = imread(input_image_file);
clear input_image_file;

[image_height, image_width, ~] = size(input_image);
image_aspect_ratio = image_width / image_height;
clear image_width image_height;

target_image_width = target_image_height * image_aspect_ratio;
clear image_aspect_ratio;

scaled_image = imresize(input_image, [target_image_height target_image_width], "bicubic");
clear input_image target_image_height target_image_width;

image_in_lab_color_space = rgb2lab(scaled_image);
clear scaled_image;

[image_height, image_width, ~] = size(image_in_lab_color_space);
image_height_middle = floor(image_height/2);
image_width_middle = floor(image_width/2);

% Unused
% top_left_x = 1:image_height_middle;
% top_left_y = 1:image_width_middle;

top_right_x = 1:image_height_middle;
top_right_y = image_width_middle:image_width;

bottom_left_x = image_height_middle:image_height;
bottom_left_y = 1:image_width_middle;

bottom_right_x = image_height_middle:image_height;
bottom_right_y = image_width_middle:image_width;

clear image_height image_width;
clear image_height_middle image_width_middle;

image_in_lab_color_space(top_right_x, top_right_y, 2:3) = 0;

image_in_lab_color_space(bottom_left_x, bottom_left_y, 1) = 50;
image_in_lab_color_space(bottom_left_x, bottom_left_y, 3) = 0;

image_in_lab_color_space(bottom_right_x, bottom_right_y, 1) = 50;
image_in_lab_color_space(bottom_right_x, bottom_right_y, 2) = 0;

clear top_right_x top_right_y;
clear bottom_left_x bottom_left_y;
clear bottom_right_x bottom_right_y;

image_in_lab_color_space_as_rgb = lab2rgb(image_in_lab_color_space);
clear image_in_lab_color_space;

figure; imshow(image_in_lab_color_space_as_rgb);
clear image_in_lab_color_space_as_rgb;
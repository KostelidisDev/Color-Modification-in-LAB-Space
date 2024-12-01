% Clear Workspace
close all;
clear;
clc;

% User Configurable Variables
input_image_file = 'peppers.png';
target_image_height = 500;

% Main Script
input_image = imread(input_image_file);
clear input_image_file;

[image_height, image_width, ~] = size(input_image);
image_aspect_ratio = image_width / image_height;
clear image_width image_height image_depth;

target_image_width = target_image_height * image_aspect_ratio;
clear image_aspect_ratio;

scaled_image = imresize(input_image, [target_image_height target_image_width], "bicubic");
clear input_image target_image_height target_image_width;

image_in_lab_color_space = rgb2lab(scaled_image);
clear scaled_image;

[image_height, image_width, ~] = size(image_in_lab_color_space);
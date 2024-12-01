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
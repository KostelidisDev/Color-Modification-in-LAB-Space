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
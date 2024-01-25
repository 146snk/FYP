clear all;


original = imread('Gimp.jpg');	%read image
original = imresize(original, [100 100]); %resize it to 100*100
original = rgb2gray(original);
original_pepper = imnoise(original,'salt & pepper',0.01); %pepper and salt

close all;
figure
imshow(original);
figure 
imshow(original_pepper);

original = uint8(floor(double(original))); %extract RGB values
original = original.';
original_pepper = uint8(floor(double(original_pepper))); %extract RGB values
original_pepper = original_pepper.'; 

fileID = fopen ('original.dat', 'w');
fprintf(fileID, '%x\n', original(1:end));
fclose (fileID);

fileID = fopen ('original_pepper.dat', 'w');
fprintf(fileID, '%x\n', original(1:end));
fclose (fileID);
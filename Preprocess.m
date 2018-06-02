
imagefiles = dir('C:\Users\Anestis\Desktop\test2.jpg');      
nfiles = length(imagefiles);    % Number of files found
c=1;
for ii=1:nfiles
    currentfilename = imagefiles(ii).name;
    t = strcat('C:\Users\Anestis\Desktop\',currentfilename);
    [II,map] = rgb2ind(imread(t),128);
    [p3, p4] = size(II);
    q1 = 226; % size of the crop box
    i3_start = ceil((p3-q1)/2); % or round instead of floor; using neither gives warning
    i3_stop = i3_start + q1;
    i4_start = ceil((p4-q1)/2);
    i4_stop = i4_start + q1;
    II = II(i3_start:i3_stop, i4_start:i4_stop);
    h = imshow(II);
    test = getimage(h);
    g = strcat('C:\Users\Anestis\Documents\MATLAB\Examples\train\',int2str(c));
    a= strcat(g,'.jpg');
    imwrite(test,map,a);
    c=c+1;
end





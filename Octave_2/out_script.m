% vi tri dau frame anh dau ra
start_index = find(sof_out.data==1);
start_index = start_index(1);
% vi tri cuoi frame anh dau ra
end_index = find(eof_out.data==1);
end_index = end_index(2);
% cac pixel nam trong anh dau ra
pixel_out = pixel_out.data(start_index:end_index);
valid_out = valid_out.data(start_index:end_index);
pixel_out = pixel_out(find(valid_out==1));
% thay doi anh ve dang ma tran 640x480
img_out = round(reshape(pixel_out, 640, 480)');
% hien thi anh dau ra
figure, imshow(uint8(img_out));

%--------------------------------------------------------------%
 for i=2:60
         image_result(pixel_out(i)-5:pixel_out(i)+5,pixel_out1(i)-5:pixel_out1(i)+5) = 255;
 end

 
  figure, imshow(uint8(I));
image = pixel_out.data(1950: 1949 + 480*640);
img_out = round(reshape(image, 640, 480)');
figure, imshow(uint8(img_out));
%--------------------------------------------------------------%

J = imread('test.jpg');
I = J(:,:,1);
I = imresize(I, [480 640]);
h1 = fspecial('gaussian', [5 5], 1.1);
r1 = filter2(h1, I, 'same');
h2 = fspecial('gaussian', [5 5], 1.3);
r2 = filter2(h2, I, 'same');
dog1= r2-r1;
h3 = fspecial('gaussian', [5 5], 1.6);
r3 = filter2(h3, I, 'same');
dog2= r3-r2;
h4 = fspecial('gaussian', [5 5], 2.0);
r4 = filter2(h4, I, 'same');
dog3= r4-r3;


vis1 = dog1;
vis2 = dog2;
vis3 = dog3;

[nrws ncls] = size(vis1);
offset = 100;
 % khoi tao cac dau vao cho Simulink
 t = 1:ncls*nrws + offset;
 dog1_in.signals.values = (1:ncls*nrws+offset)';
 dog2_in.signals.values = (1:ncls*nrws+offset)';
 dog3_in.signals.values = (1:ncls*nrws+offset)';
 valid_in.signals.values = (1:ncls*nrws+offset)';
 sof_in.signals.values = (1:ncls*nrws+offset)';
 eof_in.signals.values = (1:ncls*nrws+offset)';

 dog1_in.time = t;
 dog2_in.time = t;
 dog3_in.time = t;
 valid_in.time = t;
 sof_in.time = t;
 eof_in.time = t;

 dog1_in.signals.values(1:end) = 0;
 dog2_in.signals.values(1:end) = 0;
 dog3_in.signals.values(1:end) = 0;
 valid_in.signals.values(1:end) = 0;
 sof_in.signals.values(1:end) = 0;
 eof_in.signals.values(1:end) = 0;

 for i=1:nrws
     for j=1:ncls
         dog1_in.signals.values((i-1)*ncls+j+1) = vis1(i,j);
         dog2_in.signals.values((i-1)*ncls+j+1) = vis2(i,j);
         dog3_in.signals.values((i-1)*ncls+j+1) = vis3(i,j);
         valid_in.signals.values((i-1)*ncls+j+1) = 1;
     end
 end
 eof_in.signals.values(1) = 1;
 sof_in.signals.values(2) = 1;
 eof_in.signals.values(ncls*nrws+1) = 1;
 valid_in.signals.values(ncls*nrws+1:ncls*nrws+offset) = 1;


dog1_in.time = t;
dog2_in.time = t;
dog3_in.time = t;

 for i=1:nrws
     for j=1:ncls
         dog1_in.signals.values((i-1)*ncls+j+1) = dog1(i,j);
         
         dog2_in.signals.values((i-1)*ncls+j+1) = dog2(i,j);
         
         dog3_in.signals.values((i-1)*ncls+j+1) = dog3(i,j);
     end
 end

for i=2:nrws-1
     for j=2:ncls-1
         if(dog1(i-1)*ncls+j+1))
     end
 end

 
 figure, imshow(uint8(dog1));
figure, imshow(uint8(dog2));
figure, imshow(uint8(dog3));
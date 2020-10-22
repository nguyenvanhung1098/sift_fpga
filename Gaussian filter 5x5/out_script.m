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
h1 = fspecial('gaussian', [5 5], 1.1);
r1 = filter2(h1, I, 'same');
h2 = fspecial('gaussian', [5 5], 1.3);
r2 = filter2(h2, I, 'same');
dog1= r2-r1;
h3 = fspecial('gaussian', [5 5], 1.1);
r3 = filter2(h3, I, 'same');
dog2= r3-r2;
h4 = fspecial('gaussian', [5 5], 1.3);
r4 = filter2(h4, I, 'same');
dog3= r4-r3;
figure, imshow(uint8(dog1));
figure, imshow(uint8(dog2));
figure, imshow(uint8(dog3));
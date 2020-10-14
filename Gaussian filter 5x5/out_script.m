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
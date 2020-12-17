if (length(dir('logo.png'))>0)
 % doc anh
 J = imread('logo.png');
 I = rgb2gray(J);
 %I = J(:,:,1);
 I = imresize(I, [480 640]);
 I = I - 100;

 % anh tu camera thuong
 %vis = I(:,:,1);
 vis = I;
 % padding vien anh voi gia tri 0
 %vis = padarray(vis, [2 2], 0, 'both');
 %ir = padarray(ir, [2 2], 0, 'both');
 [nrws ncls] = size(vis);
 offset = 0;

 % khoi tao cac dau vao cho Simulink
 t = 1:ncls*nrws*8;
 pixel_in.signals.values = (1:ncls*nrws*8+offset)';
 valid_in.signals.values = (1:ncls*nrws*8+offset)';
 sof_in.signals.values = (1:ncls*nrws*8+offset)';
 eof_in.signals.values = (1:ncls*nrws*8+offset)';

 pixel_in.time = t;
 valid_in.time = t;
 sof_in.time = t;
 eof_in.time = t;

 pixel_in.signals.values(1:end) = 0;
 valid_in.signals.values(1:end) = 0;
 sof_in.signals.values(1:end) = 0;
 eof_in.signals.values(1:end) = 0;

 for i=1:nrws
     for j=1:ncls
         pixel_in.signals.values((i-1)*ncls+j) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*2) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*2) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*3) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*3) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*4) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*4) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*5) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*5) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*6) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*6) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*7) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*7) = 1;
         
     end
 end
 control = valid_in;
 control.signals.values(1:1000000) = 2^16;
 control.signals.values(1000001:end) = 2^17 + 2^16 + 2^15;
 

 sof_in.signals.values(1) = 1;
 eof_in.signals.values(ncls*nrws) = 1;
 sof_in.signals.values(1 +ncls*nrws ) = 1;
 eof_in.signals.values(ncls*nrws * 2) = 1;
 sof_in.signals.values(1 +ncls*nrws*2 ) = 1;
 eof_in.signals.values(ncls*nrws * 3) = 1;
 sof_in.signals.values(1 +ncls*nrws*3 ) = 1;
 eof_in.signals.values(ncls*nrws * 4) = 1;
 sof_in.signals.values(1 +ncls*nrws*4 ) = 1;
 eof_in.signals.values(ncls*nrws * 5) = 1;
 sof_in.signals.values(1 +ncls*nrws*5 ) = 1;
 eof_in.signals.values(ncls*nrws * 6) = 1;
 sof_in.signals.values(1 +ncls*nrws*6 ) = 1;
 eof_in.signals.values(ncls*nrws * 7) = 1;
 sof_in.signals.values(1 +ncls*nrws*7 ) = 1;
 eof_in.signals.values(ncls*nrws * 8) = 1;
 
else
 % thong bao loi neu anh khong ton tai
 alt_dspbuilder_error('Unable to locate the image image_in.jpg');
 disp([' > Unable to locate the image image_in.jpg']);
end
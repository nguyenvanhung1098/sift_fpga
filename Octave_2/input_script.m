if (length(dir('test.jpg'))>0)
 % doc anh
 J = imread('test.jpg');
 I = J(:,:,1);
 I = imresize(I, [480 640]);
 % anh tu camera thuong
 vis = I(:,:,1);
 
 % padding vien anh voi gia tri 0
 %vis = padarray(vis, [2 2], 0, 'both');
 %ir = padarray(ir, [2 2], 0, 'both');
 [nrws ncls] = size(vis);
 offset = 0;

 % khoi tao cac dau vao cho Simulink
 t = 1:ncls*nrws*2 + offset;
 pixel_in.signals.values = (1:ncls*nrws*2+offset)';
 valid_in.signals.values = (1:ncls*nrws*2+offset)';
 sof_in.signals.values = (1:ncls*nrws*2+offset)';
 eof_in.signals.values = (1:ncls*nrws*2+offset)';

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
         pixel_in.signals.values((i-1)*ncls+j+1) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+1) = 1;
         pixel_in.signals.values((i-1)*ncls+j+1 + 640*480) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+1 +640*480) = 1;
     end
 end
 eof_in.signals.values(1) = 1;
 sof_in.signals.values(2) = 1;
 eof_in.signals.values(1+640*480) = 1;
 sof_in.signals.values(2640*480) = 1;
 eof_in.signals.values(ncls*nrws+1) = 1;
 valid_in.signals.values(ncls*nrws+1:ncls*nrws+offset) = 1;
 
 eof_in.signals.values(ncls*nrws+1+ 640*480) = 1;
 valid_in.signals.values(ncls*nrws+1:ncls*nrws+offset+ 640*480) = 1;
else
 % thong bao loi neu anh khong ton tai
 alt_dspbuilder_error('Unable to locate the image image_in.jpg');
 disp([' > Unable to locate the image image_in.jpg']);
end

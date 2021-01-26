 %Doc anh dau vao
 J = imread('test1.jpg');
 I = rgb2gray(J);
 %I = J(:,:,1);
 I = imresize(I, [480 640]);
 I = I - 100;
 [nrws ncls] = size(I);
 offset = 100;

 % khoi tao cac dau vao cho Simulink
 t = 1:ncls*nrws*7+ offset;
 pixel_in.signals.values = (1:ncls*nrws*7+offset)';
 valid_in.signals.values = (1:ncls*nrws*7+offset)';
 sof_in.signals.values = (1:ncls*nrws*7+offset)';
 eof_in.signals.values = (1:ncls*nrws*7+offset)';

 pixel_in.time = t;
 valid_in.time = t;
 sof_in.time = t;
 eof_in.time = t;

 pixel_in.signals.values(1:end) = 0;
 valid_in.signals.values(1:end) = 0;
 sof_in.signals.values(1:end) = 0;
 eof_in.signals.values(1:end) = 0;
 control = valid_in;
 control.signals.values(1:480*640) = 0;
 control.signals.values(1+480*640:480*640*2) = 1;
 control.signals.values(1+480*640*2:480*640*3) = 1+2;
 control.signals.values(1+480*640*3:end) = 7;

 for i=1:nrws
     for j=1:ncls
         pixel_in.signals.values((i-1)*ncls+j) = I(i,j);
         valid_in.signals.values((i-1)*ncls+j) = 1;
         pixel_in.signals.values((i-1)*ncls + 480*640 +j) = I(i,j);
         valid_in.signals.values((i-1)*ncls + 480*640 +j) = 1;
         pixel_in.signals.values((i-1)*ncls + 2*480*640 +j) = I(i,j);
         valid_in.signals.values((i-1)*ncls + 2*480*640 +j) = 1;
         pixel_in.signals.values((i-1)*ncls + 3*480*640 +j) = I(i,j);
         valid_in.signals.values((i-1)*ncls + 3*480*640 +j) = 1;
         pixel_in.signals.values((i-1)*ncls + 4*480*640 +j) = I(i,j);
         valid_in.signals.values((i-1)*ncls + 4*480*640 +j) = 1;
         pixel_in.signals.values((i-1)*ncls + 5*480*640 +j) = I(i,j);
         valid_in.signals.values((i-1)*ncls + 5*480*640 +j) = 1;
         pixel_in.signals.values((i-1)*ncls + 6*480*640 +j) = I(i,j);
         valid_in.signals.values((i-1)*ncls + 6*480*640 +j) = 1;
     end
 end

 sof_in.signals.values(1) = 1;
 eof_in.signals.values(ncls*nrws) = 1;
 sof_in.signals.values(1 + 1*480*640) = 1;
 eof_in.signals.values(ncls*nrws + 1*480*640) = 1;
 sof_in.signals.values(1 + 2*480*640) = 1;
 eof_in.signals.values(ncls*nrws + 2*480*640) = 1;
 sof_in.signals.values(1 + 3*480*640) = 1;
 eof_in.signals.values(ncls*nrws + 3*480*640) = 1;
 sof_in.signals.values(1 + 4*480*640) = 1;
 eof_in.signals.values(ncls*nrws + 4*480*640) = 1;
 sof_in.signals.values(1 + 5*480*640) = 1;
 eof_in.signals.values(ncls*nrws + 5*480*640) = 1;
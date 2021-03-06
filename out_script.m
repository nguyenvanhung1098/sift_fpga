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

iskeypoint = isKeypoint.time(find(isKeypoint.data==1));
iskeypoint = iskeypoint(3:end);
m_xy = mxy.Data(iskeypoint);
ori = orien.data(iskeypoint);

figure, imshow(imresize(J, [480 640]));
    hold on;
    for i=1:34
        x1 = mod(iskeypoint(i),640);
        y1 = uint16((iskeypoint(i))/640);
        L = m_xy(i)/4+10;
        alpha = ori(i)*45;
        x2 = x1 + 1+(L/2*cos(alpha));
        y2 = y1 + 1+(L/2*sin(alpha));
        plot(x1,y1,'bo','MarkerSize',L,'LineWidth',1);
        plot([x1 x2],[y1 y2],'b');
    end
    
J = imread('img1.png');
J1 = imread('img2.png');
figure;
height = 480; 
width= 1280;
combined_image = ones(height, width, 3);
combined_image(1:480,1:640,:) = imresize(J1, [480 640]);
combined_image(1:480,641:1280,:) = imresize(J, [480 640]);
imagesc(double(combined_image)/double(255));
colormap(gray(256));
hold on;
for i=1:107
        x2 = mod(iskeypoint(match(i)),640);
        y2 = uint16((iskeypoint(match(i)))/640);
        x1 = mod(iskeypoint1(match1(i)),640)+639;
        y1 = uint16((iskeypoint1(match1(i)))/640);
        if (2 < x2) & (x2 < 638) & (2 < y2) & (y2< 438)&(642 < x1) & (x1 < 1278) & (2 < y1) & (y1< 438)
            plot(x1,y1,'bo','MarkerSize',5,'LineWidth',1);
            plot(x2,y2,'bo','MarkerSize',5,'LineWidth',1);
            plot([x1,x2],[y1,y2],'-', 'LineWidth', 1);
        end
end
hold off;
%--------------------------------------------------------------%
 for i=1:6
         image1(row_match(i)-2:row_match(i)+2,column_match(i)-2:column_match(i)+2) = 255;
 end

%Hien thi anh ban dau
figure, imshow(uint8(I));
%Hien thi anh sau khi qua khoi gaussian_filter
image = pixel_out.data(1304: 1303 + 480*640);
img_out = round(reshape(image, 640, 480)');
figure, imshow(uint8(img_out));



isKeyPoint2 = isKeyPoint.time(find(isKeyPoint.data == 1));
column = mod(isKeyPoint1 - 1978,640)
row = round(isKeyPoint1/480);
image = I;
for i=1:193
         image(row(i)-2:row(i)+2,column(i)-2:column(i)+2) ;
 end
figure, imshow(uint8(image));
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
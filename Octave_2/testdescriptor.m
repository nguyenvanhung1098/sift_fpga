for i=1:nrws
     for j=1:ncls
         pixel_in.signals.values((i-1)*ncls+j) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640) = 1;
         pixel_in.signals.values((i-1)*ncls+j + 480*640*2) = vis(i,j);
         valid_in.signals.values((i-1)*ncls+j+ 480*640*2) = 1;
     end
end

m = [];
n = [];
for i=3:16
     for j=3:13
            a1 = abs(mod(descriptor1(i),65536)- mod(descriptor2(j),65536));
            a2 = abs(mod(round(descriptor1(i)/65536),65536)- mod(round(descriptor2(j)/65536),65536));
            a3 = abs(mod(round(descriptor1(i)/(65536*65536)),65536)- mod(round(descriptor2(j)/(65536*65536)),65536));
            a4 = abs(mod(round(descriptor1(i)/(65536^3)),65536)- mod(round(descriptor2(j)/(65536^3)),65536));
            a5 = abs(mod(round(descriptor1(i)/(65536^4)),65536)- mod(round(descriptor2(j)/(65536^4)),65536));
            a6 = abs(mod(round(descriptor1(i)/(65536^5)),65536)- mod(round(descriptor2(j)/(65536^5)),65536));
            a7 = abs(mod(round(descriptor1(i)/(65536^6)),65536)- mod(round(descriptor2(j)/(65536^6)),65536));
            a8 = abs(mod(round(descriptor1(i)/(65536^7)),65536)- mod(round(descriptor2(j)/(65536^7)),65536));
            a9 = abs(mod(round(descriptor1(i)/(65536^8)),65536)- mod(round(descriptor2(j)/(65536^8)),65536));
            a10 = abs(mod(round(descriptor1(i)/(65536^9)),65536)- mod(round(descriptor2(j)/(65536^9)),65536));
            a11 = abs(mod(round(descriptor1(i)/(65536^10)),65536)- mod(round(descriptor2(j)/(65536^10)),65536));
            a12 = abs(mod(round(descriptor1(i)/(65536^11)),65536)- mod(round(descriptor2(j)/(65536^11)),65536));
            a13 = abs(mod(round(descriptor1(i)/(65536^12)),65536)- mod(round(descriptor2(j)/(65536^12)),65536));
            a14 = abs(mod(round(descriptor1(i)/(65536^13)),65536)- mod(round(descriptor2(j)/(65536^13)),65536));
            a15 = abs(mod(round(descriptor1(i)/(65536^14)),65536)- mod(round(descriptor2(j)/(65536^14)),65536));
            a16 = abs(mod(round(descriptor1(i)/(65536^15)),65536)- mod(round(descriptor2(j)/(65536^15)),65536));
            a17 = abs(mod(round(descriptor1(i)/(65536^16)),65536)- mod(round(descriptor2(j)/(65536^16)),65536));
            a18 = abs(mod(round(descriptor1(i)/(65536^17)),65536)- mod(round(descriptor2(j)/(65536^17)),65536));
            a19 = abs(mod(round(descriptor1(i)/(65536^18)),65536)- mod(round(descriptor2(j)/(65536^18)),65536));
            a20 = abs(mod(round(descriptor1(i)/(65536^19)),65536)- mod(round(descriptor2(j)/(65536^19)),65536));
            a21 = abs(mod(round(descriptor1(i)/(65536^20)),65536)- mod(round(descriptor2(j)/(65536^20)),65536));
            a22 = abs(mod(round(descriptor1(i)/(65536^21)),65536)- mod(round(descriptor2(j)/(65536^21)),65536));
            a23 = abs(mod(round(descriptor1(i)/(65536^22)),65536)- mod(round(descriptor2(j)/(65536^22)),65536));
            a24 = abs(mod(round(descriptor1(i)/(65536^23)),65536)- mod(round(descriptor2(j)/(65536^23)),65536));
            a25 = abs(mod(round(descriptor1(i)/(65536^24)),65536)- mod(round(descriptor2(j)/(65536^24)),65536));
            a26 = abs(mod(round(descriptor1(i)/(65536^25)),65536)- mod(round(descriptor2(j)/(65536^25)),65536));
            a27 = abs(mod(round(descriptor1(i)/(65536^26)),65536)- mod(round(descriptor2(j)/(65536^26)),65536));
            a28 = abs(mod(round(descriptor1(i)/(65536^27)),65536)- mod(round(descriptor2(j)/(65536^27)),65536));
            a29 = abs(mod(round(descriptor1(i)/(65536^28)),65536)- mod(round(descriptor2(j)/(65536^28)),65536));
            a30 =  abs(mod(round(descriptor1(i)/(65536^29)),65536)- mod(round(descriptor2(j)/(65536^29)),65536));
            a31 =  abs(mod(round(descriptor1(i)/(65536^30)),65536)- mod(round(descriptor2(j)/(65536^30)),65536));
            a32 = abs(mod(round(descriptor1(i)/(65536^31)),65536)- mod(round(descriptor2(j)/(65536^31)),65536));
            a33 = abs(mod(round(descriptor1(i)/(65536^32)),65536)- mod(round(descriptor2(j)/(65536^32)),65536));
            a34 =abs(mod(round(descriptor1(i)/(65536^33)),65536)- mod(round(descriptor2(j)/(65536^33)),65536));
            a35 =abs(mod(round(descriptor1(i)/(65536^34)),65536)- mod(round(descriptor2(j)/(65536^34)),65536));
            a36 =abs(mod(round(descriptor1(i)/(65536^35)),65536)- mod(round(descriptor2(j)/(65536^35)),65536));
            b1 = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10 ;
            b2 = a11 + a12 + a13 + a14 + a15 + a16 + a17 + a18 + a19 + a20 ;
            b3 = a21 + a22 + a23 + a24 + a25 + a26 + a27 + a28 + a29 + a30 + a31 + a32 + a33 + a34 + a35 + a36 ;
            b = b1 + b2 + b3;
            if b <= 10
                 m = [m, i];
                 n= [n,j];
            end   
     end
 end
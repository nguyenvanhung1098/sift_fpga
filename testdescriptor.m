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
hist11 = hist1;
hist12 = hist2;
hist13 = hist3;
hist14 = hist4;
hist15 = hist5;
hist16 = hist6;
hist17 = hist7;
hist18 = hist8;
hist19 = hist9;
hist111 = hist1;
hist112 = hist2;
hist113 = hist3;
hist114 = hist4;
hist115 = hist5;
hist116 = hist6;
hist117 = hist7;
hist118 = hist8;
hist119 = hist9;
Hist1 = hist1;
Hist2 = hist2;
Hist3 = hist3;
Hist4 = hist4;
Hist5 = hist5;
Hist6 = hist6;
Hist7 = hist7;
Hist8 = hist8;
Hist9 = hist9;

hist1 = Hist1;
hist2 = Hist2;
hist3 = Hist3;
hist4 = Hist4;
hist5 = Hist5;
hist6 = Hist6;
hist7 = Hist7;
hist8 = Hist8;
hist9 = Hist9;

hist11 = hist111;
hist12 = hist112;
hist13 = hist113;
hist14 = hist114;
hist15 = hist115;
hist16 = hist116;
hist17 = hist117;
hist18 = hist118;
hist19 = hist119;


mxy1= mxy;
orien1= orien;
iskeypoint1= isKeypoint;
two_octave1 = two_octave;
octave11 = octave1;
octave10 = octave0;

hist1 = hist1.data(6477:6476 + 307200);
hist2 = hist2.data(6477:6476 + 307200);
hist3 = hist3.data(6477:6476 + 307200);
hist4 = hist4.data(6477:6476 + 307200);
hist5 = hist5.data(6477:6476 + 307200);
hist6 = hist6.data(6477:6476 + 307200);
hist7 = hist7.data(6477:6476 + 307200);
hist8 = hist8.data(6477:6476 + 307200);
hist9 = hist9.data(6477:6476 + 307200);
hist11 = hist11.data(6477:6476 + 307200);
hist12 = hist12.data(6477:6476 + 307200);
hist13 = hist13.data(6477:6476 + 307200);
hist14 = hist14.data(6477:6476 + 307200);
hist15 = hist15.data(6477:6476 + 307200);
hist16 = hist16.data(6477:6476 + 307200);
hist17 = hist17.data(6477:6476 + 307200);
hist18 = hist18.data(6477:6476 + 307200);
hist19 = hist19.data(6477:6476 + 307200);

rs = hist11;
for i  = 1:307200/2
    a = rs(i);
    rs(i) = rs(307201-i);
    rs(307201-i) = a;
end
rs1 = [hist1,rs];

hist11 = hist11(iskeypoint1); 
hist12 = hist12(iskeypoint1);
hist13 = hist13(iskeypoint1);
hist14 = hist14(iskeypoint1);
hist15 = hist15(iskeypoint1);
hist16 = hist16(iskeypoint1);
hist17 = hist17(iskeypoint1);
hist18 = hist18(iskeypoint1);
hist19 = hist19(iskeypoint1);
hist1 = hist1(iskeypoint); 
hist2 = hist2(iskeypoint);
hist3 = hist3(iskeypoint);
hist4 = hist4(iskeypoint);
hist5 = hist5(iskeypoint);
hist6 = hist6(iskeypoint);
hist7 = hist7(iskeypoint);
hist8 = hist8(iskeypoint);
hist9 = hist9(iskeypoint);
match = [];
match1 = [];
n= 0.8;

for i=1:914
     pos = 0;
     min1 = 1000000000000000;
     min2 = 1000000000000000;
     for j=1:914
          
            a1 = abs(mod(hist1(i),65536)- mod(hist11(j),65536));
            a2 = abs(mod(hist2(i),65536)- mod(hist12(j),65536));
            a3 = abs(mod(hist3(i),65536)- mod(hist13(j),65536));
            a4 = abs(mod(hist4(i),65536)- mod(hist14(j),65536));
            a5 = abs(mod(hist5(i),65536)- mod(hist15(j),65536));
            a6 = abs(mod(hist6(i),65536)- mod(hist16(j),65536));
            a7 = abs(mod(hist7(i),65536)- mod(hist17(j),65536));
            a8 = abs(mod(hist8(i),65536)- mod(hist18(j),65536));
            
            a9 = abs(mod(round(hist1(i)/65536),65536)- mod(round(hist11(j)/65536),65536));
            a10 = abs(mod(round(hist2(i)/65536),65536)- mod(round(hist12(j)/65536),65536));
            a11 = abs(mod(round(hist3(i)/65536),65536)- mod(round(hist13(j)/65536),65536));
            a12 = abs(mod(round(hist4(i)/65536),65536)- mod(round(hist14(j)/65536),65536));
            a13 = abs(mod(round(hist5(i)/65536),65536)- mod(round(hist15(j)/65536),65536));
            a14 = abs(mod(round(hist6(i)/65536),65536)- mod(round(hist16(j)/65536),65536));
            a15 = abs(mod(round(hist7(i)/65536),65536)- mod(round(hist17(j)/65536),65536));
            a16 = abs(mod(round(hist8(i)/65536),65536)- mod(round(hist18(j)/65536),65536));
            
            a17 = abs(mod(round(hist1(i)/(65536^2)),65536)- mod(round(hist11(j)/(65536^2)),65536));
            a18 = abs(mod(round(hist2(i)/(65536^2)),65536)- mod(round(hist12(j)/(65536^2)),65536));
            a19 = abs(mod(round(hist3(i)/(65536^2)),65536)- mod(round(hist13(j)/(65536^2)),65536));
            a20 = abs(mod(round(hist4(i)/(65536^2)),65536)- mod(round(hist14(j)/(65536^2)),65536));
            a21 = abs(mod(round(hist5(i)/(65536^2)),65536)- mod(round(hist15(j)/(65536^2)),65536));
            a22 = abs(mod(round(hist6(i)/(65536^2)),65536)- mod(round(hist16(j)/(65536^2)),65536));
            a23 = abs(mod(round(hist7(i)/(65536^2)),65536)- mod(round(hist17(j)/(65536^2)),65536));
            a24 = abs(mod(round(hist8(i)/(65536^2)),65536)- mod(round(hist18(j)/(65536^2)),65536));
            
            a25 = abs(mod(round(hist1(i)/(65536^3)),65536)- mod(round(hist11(j)/(65536^3)),65536));
            a26 = abs(mod(round(hist2(i)/(65536^3)),65536)- mod(round(hist12(j)/(65536^3)),65536));
            a27 = abs(mod(round(hist3(i)/(65536^3)),65536)- mod(round(hist13(j)/(65536^3)),65536));
            a28 = abs(mod(round(hist4(i)/(65536^3)),65536)- mod(round(hist14(j)/(65536^3)),65536));
            a29 = abs(mod(round(hist5(i)/(65536^3)),65536)- mod(round(hist15(j)/(65536^3)),65536));
            a30 = abs(mod(round(hist6(i)/(65536^3)),65536)- mod(round(hist16(j)/(65536^3)),65536));
            a31 = abs(mod(round(hist7(i)/(65536^3)),65536)- mod(round(hist17(j)/(65536^3)),65536));
            a32 = abs(mod(round(hist8(i)/(65536^3)),65536)- mod(round(hist18(j)/(65536^3)),65536));
            
            a33 = abs(mod(round(hist1(i)/(65536^4)),65536)- mod(round(hist11(j)/(65536^4)),65536));
            a34 = abs(mod(round(hist2(i)/(65536^4)),65536)- mod(round(hist12(j)/(65536^4)),65536));
            a35 = abs(mod(round(hist3(i)/(65536^4)),65536)- mod(round(hist13(j)/(65536^4)),65536));
            a36 = abs(mod(round(hist4(i)/(65536^4)),65536)- mod(round(hist14(j)/(65536^4)),65536));
            a37 = abs(mod(round(hist5(i)/(65536^4)),65536)- mod(round(hist15(j)/(65536^4)),65536));
            a38 = abs(mod(round(hist6(i)/(65536^4)),65536)- mod(round(hist16(j)/(65536^4)),65536));
            a39 = abs(mod(round(hist7(i)/(65536^4)),65536)- mod(round(hist17(j)/(65536^4)),65536));
            a40 = abs(mod(round(hist8(i)/(65536^4)),65536)- mod(round(hist18(j)/(65536^4)),65536));
            
            a41 = abs(mod(round(hist1(i)/(65536^5)),65536)- mod(round(hist11(j)/(65536^5)),65536));
            a42 = abs(mod(round(hist2(i)/(65536^5)),65536)- mod(round(hist12(j)/(65536^5)),65536));
            a43 = abs(mod(round(hist3(i)/(65536^5)),65536)- mod(round(hist13(j)/(65536^5)),65536));
            a44 = abs(mod(round(hist4(i)/(65536^5)),65536)- mod(round(hist14(j)/(65536^5)),65536));
            a45 = abs(mod(round(hist5(i)/(65536^5)),65536)- mod(round(hist15(j)/(65536^5)),65536));
            a46 = abs(mod(round(hist6(i)/(65536^5)),65536)- mod(round(hist16(j)/(65536^5)),65536));
            a47 = abs(mod(round(hist7(i)/(65536^5)),65536)- mod(round(hist17(j)/(65536^5)),65536));
            a48 = abs(mod(round(hist8(i)/(65536^5)),65536)- mod(round(hist18(j)/(65536^5)),65536));
            
            a49 = abs(mod(round(hist1(i)/(65536^6)),65536)- mod(round(hist11(j)/(65536^6)),65536));
            a50 = abs(mod(round(hist2(i)/(65536^6)),65536)- mod(round(hist12(j)/(65536^6)),65536));
            a51 = abs(mod(round(hist3(i)/(65536^6)),65536)- mod(round(hist13(j)/(65536^6)),65536));
            a52 = abs(mod(round(hist4(i)/(65536^6)),65536)- mod(round(hist14(j)/(65536^6)),65536));
            a53 = abs(mod(round(hist5(i)/(65536^6)),65536)- mod(round(hist15(j)/(65536^6)),65536));
            a54 = abs(mod(round(hist6(i)/(65536^6)),65536)- mod(round(hist16(j)/(65536^6)),65536));
            a55 = abs(mod(round(hist7(i)/(65536^6)),65536)- mod(round(hist17(j)/(65536^6)),65536));
            a56 = abs(mod(round(hist8(i)/(65536^6)),65536)- mod(round(hist18(j)/(65536^6)),65536));
            
            
            a57 = abs(mod(round(hist1(i)/(65536^7)),65536)- mod(round(hist11(j)/(65536^7)),65536));
            a58 = abs(mod(round(hist2(i)/(65536^7)),65536)- mod(round(hist12(j)/(65536^7)),65536));
            a59 = abs(mod(round(hist3(i)/(65536^7)),65536)- mod(round(hist13(j)/(65536^7)),65536));
            a60 = abs(mod(round(hist4(i)/(65536^7)),65536)- mod(round(hist14(j)/(65536^7)),65536));
            a61 = abs(mod(round(hist5(i)/(65536^7)),65536)- mod(round(hist15(j)/(65536^7)),65536));
            a62 = abs(mod(round(hist6(i)/(65536^7)),65536)- mod(round(hist16(j)/(65536^7)),65536));
            a63 = abs(mod(round(hist7(i)/(65536^7)),65536)- mod(round(hist17(j)/(65536^7)),65536));
            a64 = abs(mod(round(hist8(i)/(65536^7)),65536)- mod(round(hist18(j)/(65536^7)),65536));
            
            a65 = abs(mod(round(hist1(i)/(65536^8)),65536)- mod(round(hist11(j)/(65536^8)),65536));
            a66 = abs(mod(round(hist2(i)/(65536^8)),65536)- mod(round(hist12(j)/(65536^8)),65536));
            a67 = abs(mod(round(hist3(i)/(65536^8)),65536)- mod(round(hist13(j)/(65536^8)),65536));
            a68 = abs(mod(round(hist4(i)/(65536^8)),65536)- mod(round(hist14(j)/(65536^8)),65536));
            a69 = abs(mod(round(hist5(i)/(65536^8)),65536)- mod(round(hist15(j)/(65536^8)),65536));
            a70 = abs(mod(round(hist6(i)/(65536^8)),65536)- mod(round(hist16(j)/(65536^8)),65536));
            a71 = abs(mod(round(hist7(i)/(65536^8)),65536)- mod(round(hist17(j)/(65536^8)),65536));
            a72 = abs(mod(round(hist8(i)/(65536^8)),65536)- mod(round(hist18(j)/(65536^8)),65536));
            b1 = a1*a1 + a2*a2 + a3*a3 + a4*a4 + a5*a5 +a6*a6 + a7*a7 + a8*a8 +a9*a9 + a10*a10;
            b2 = a11*a11 + a12*a12 + a13*a13 + a14*a14 + a15*a15 +a16*a16 + a17*a17 + a18*a18 +a19*a19 + a20*a20;
            b3 = a21*a21 + a22*a22 + a23*a23 + a24*a24 + a25*a25 +a26*a26 + a27*a27 + a28*a28 +a29*a29 + a30*a30;
            b4 = a31*a31 + a32*a32 + a33*a33 + a34*a34 + a35*a35 +a36*a36 + a37*a37 + a38*a38 +a39*a39 + a40*a40;
            b5 = a41*a41 + a42*a42 + a43*a43 + a44*a44 + a45*a45 +a46*a46 + a47*a47 + a48*a48 +a49*a49 + a50*a50;
            b6 = a51*a51 + a52*a52 + a53*a53 + a54*a54 + a55*a55 +a56*a56 + a57*a57 + a58*a58 +a59*a59 + a60*a60;
            b7 = a61*a61 + a62*a62 + a63*a63 + a64*a64 + a65*a65 +a66*a66 + a67*a67 + a68*a68 +a69*a69 + a70*a70 + a71*a71 + a72*a72;
            distance = sqrt(b1+b2+b3+b4+b5+b6+b7);
            if distance <= min1;
                min2 = min1;
                min1 = distance;
                pos = j;
            end
     end
     if min1 <=  n*min2
                match = [match,i];
                match1 = [match1,pos];
     end
 end
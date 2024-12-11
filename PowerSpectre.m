function [PS] = PowerSpectre(seq)
n=length(seq);
uA=zeros(1, n);
uC=zeros(1, n);
uG=zeros(1, n);
uT=zeros(1, n);
nA=0;
nC=0;
nG=0;
nT=0;
for i=1:n
    nu=seq(i);
   switch upper(nu)
      case {'A'}
           uA(i)=1;
           uC(i)=0;
           uG(i)=0;
           uT(i)=0;
           nA=nA+1;
      case {'C'}
           uC(i)=1;
           uA(i)=0;
           uG(i)=0;
           uT(i)=0;
           nC=nC+1;     
      case {'G'}
           uG(i)=1;
           uA(i)=0;
           uC(i)=0;
           uT(i)=0;
           nG=nG+1;
      case {'T'}
           uT(i)=1;
           uA(i)=0;
           uC(i)=0;
           uG(i)=0;
           nT=nT+1;
   end
end
%Discrete Fourier Transforms
UA=dft(uA);   
UC=dft(uC);
UG=dft(uG);
UT=dft(uT);
%Exclude the first term
UA(1)=[];
UC(1)=[];
UG(1)=[];
UT(1)=[];
% Get the first half of the transform (since it's symmetric)
m=floor((n-1)/2);
UA1=UA(1:m);
UC1=UC(1:m);
UG1=UG(1:m);
UT1=UT(1:m);
%Power spectrums
PSA=abs(UA).^2;     
PSC=abs(UC).^2;     
PSG=abs(UG).^2;     
PST=abs(UT).^2;     
PS = PSA+PSC+PSG+PST;
PS(1) = [];
PS = evenScaling(PS,345);
end
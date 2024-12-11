function y = dft(x)
N=length(x);
y=zeros(size(x));
for k=0:N-1
for n=0:N-1;
y(k+1) = y(k+1) + x(n+1)*(exp(-j*2*pi*k*n/N));
end
end
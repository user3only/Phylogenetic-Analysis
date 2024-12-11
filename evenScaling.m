function [PSNew] = evenScaling(PS,M)

N= length(PS);
PSNew=zeros(1,M);
PSNew(1)=PS(1);

for i=2:M
  s=round((i-1)*N/M);
  e=round(i*N/M);
  PSNew(i)=mean(PS(s:e));
end

end
function [NSEDist] = NSEDist(A,B)
meanA=mean(A);
meanB=mean(B);

NSEDist=((1/2)*(norm((A-meanA)-(B-meanB)))^.2)/(((norm(A-meanA)).^2)+((norm(B-meanB)).^2));
end
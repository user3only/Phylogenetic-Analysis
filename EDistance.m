function [EDist] = EDistance(A,B)

diffSquare=(A-B).^2;
EDist=sqrt(sum(diffSquare,2));
end
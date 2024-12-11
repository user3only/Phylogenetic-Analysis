function UPGMA(name)
tStart = tic;
file=strcat(name,'.fasta');
seqs = fastaread(file);
len = length(seqs);
for i = 1:len
     lenX(i)=length(seqs(i).Sequence);
end
lenX
b=max(lenX);
fprintf('Min: %d \n', min(lenX));
fprintf('Max: %d \n', max(lenX));
for i=1:len
    
           PS{i}=1/b*PowerSpectre(seqs(i).Sequence);
           
end
for j=1:len
    for i=j:len        
               D(i,j)=NSEDist(PS{i}, PS{j});   
    end 
end 
d=squareform(D);
%Phylogenetic tree
tree= seqlinkage(d,'average',seqs);
h = plot(tree, 'orient', 'left');
title('PHYLOGENETIC TREE', 'FontName', 'AvantGarde','FontSize', 10,'FontWeight','bold')
tEnd = toc(tStart);
fprintf('%d minutes and %f seconds\n',floor(tEnd/60),rem(tEnd,60));
end
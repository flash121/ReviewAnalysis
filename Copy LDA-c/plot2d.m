function likelihood=plot2d(doc,var_gamma,model)

k=0.0001:0.001:1;
likelihood=zeros(length(k));
for i=1:length(k)
    for j=1:length(k)
        likelihood(i,j)=compute_likelihood4(doc,model,[k(i) k(j)],var_gamma);
    end
end
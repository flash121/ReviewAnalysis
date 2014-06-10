function likelihood=plot2dgamma(doc,phi,model)

k=1:1:200;
likelihood=zeros(length(k));
for i=1:length(k)
    for j=1:length(k)
        likelihood(i,j)=compute_likelihood5(doc,model,phi,[k(i) k(j)]);
    end
    disp(i)
end
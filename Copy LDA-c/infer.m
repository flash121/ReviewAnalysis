function [likeihood model var_gamma phi]=infer(model, corpus,param)

var_gamma = zeros(corpus.nd,param.K);
for d=1:corpus.nd
    
    if ((mod(d,100)==0) && d>0)
        disp(d)
    end
    doc = corpus.docs{d};
    phi=zeros(length(doc),param.K);
    for n=1: length(doc)
        [likeihood model t_gamma t_phi]= lda_inference(doc, model, var_gamma(d), phi(n,:));
        phi(n,:)=t_phi;
        var_gamma(d)=t_gamma;
        disp(likeihood)
    end
end
    
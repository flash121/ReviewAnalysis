function [likelihood ss gamma phi]=doc_e_step(doc, gamma, phi, model, ss)
    [likelihood gamma phi] = lda_inference(doc, model, gamma, phi);
    
    gamma_sum=sum(gamma);
    ss.alpha_suffstats=ss.alpha_suffstats+sum(psi(gamma))-model.K * psi(gamma_sum);
 
    for n = 1 : doc.len
        for k=1:model.K
            ss.class_word(k,doc.words(n)) = ss.class_word(k,doc.words(n)) +doc.counts(n)*phi(n,k);
            ss.class_total(k) = ss.class_total(k)+doc.counts(n)*phi(n,k);
        end
    end
%     Count=repmat(doc.counts,[1,model.K]).*phi(1:doc.len,:);
%     ss.class_word(:,doc.words)=ss.class_word(:,doc.words)+Count';
%     ss.class_total=sum(Count);
    ss.num_docs = ss.num_docs + 1;

function [model,ss]=lda_mle(model, ss, estimate_alpha)
for k=1:model.K
    for w=1:model.nw
        if(ss.class_word(k,w)>0)
            model.log_prob_w(k,w)=log(ss.class_word(k,w))-log(ss.class_total(k));
        else
            model.log_prob_w(k,w)=-100;
        end
    end
end
if estimate_alpha
    model.alpha=opt_alpha_test(ss.alpha_suffstats,ss.num_docs,model.K);
end
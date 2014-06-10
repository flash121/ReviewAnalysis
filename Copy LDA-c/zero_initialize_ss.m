function ss=zero_initialize_ss(ss,model)

ss.class_total=zeros(1,model.K);
ss.class_word=zeros(model.K,model.nw);

ss.num_docs=0;
ss.alpha_suffstats=0;

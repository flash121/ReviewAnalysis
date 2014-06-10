function ss=new_lda_suffstats(model)

 K=model.K;
 nw=model.nw;
 ss.class_total=zeros(1,K);
 ss.class_word=zeros(K,nw);

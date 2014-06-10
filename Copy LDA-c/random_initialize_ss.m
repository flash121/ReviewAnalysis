function ss=random_initialize_ss(ss,model)

num_topics=model.K;
num_terms=model.nw;
for k=1:num_topics
    for n=1:num_terms
        ss.class_word(k,n)=ss.class_word(k,n)+1/num_terms+rand;
        ss.class_total(k)=ss.class_total(k)+ss.class_word(k,n);
    end
end
ss.num_docs=0;
ss.alpha_suffstats=0;
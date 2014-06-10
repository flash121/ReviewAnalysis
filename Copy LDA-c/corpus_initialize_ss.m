function ss=corpus_initialize_ss(ss,model,c)
NUM_INIT=1; %times to generate ss from rand document used to initalize ss
num_topics=model.K;
for k=1:num_topics
    for i=1:NUM_INIT
        d=ceil(rand*c.nd);
        disp(['initialized with document ' num2str(d)])
        doc=c.docs{d};
        for n=1:doc.len
            ss.class_word(k,doc.words(n))=ss.class_word(k,doc.words(n))+doc.counts(n);
        end
    end
    for n=1:model.nw
        ss.class_word(k,n)=ss.class_word(k,n)+1;
        ss.class_total(k)=ss.class_total(k)+ss.class_word(k,n);
    end
end

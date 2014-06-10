function [model,var_gamma,phiset,LK]=run_em(start,corpus,param)
var_gamma=zeros(corpus.nd,param.K);
max_length = corpus.max_len;
phi=zeros(max_length,param.K);

    if (strcmp(start, 'seeded')==1)
        model = new_lda_model(corpus.nw, param.K);
        ss = new_lda_suffstats(model);
        ss=corpus_initialize_ss(ss,model, corpus);
        [model,ss]=lda_mle(model, ss, 0);
        model.alpha = param.init_alpha;
    elseif (strcmp(start, 'random')==1)
        model = new_lda_model(corpus.nw, param.K);
        ss = new_lda_suffstats(model);
        ss=random_initialize_ss(ss, model);
        [model,ss]=lda_mle(model, ss, 0);
        model.alpha = param.init_alpha;
    else
        model = load_lda_model(start);
        ss = new_lda_suffstats(model);
    end
    % run Expectation Maximization
    i = 0;
    likelihood_old = 0;
    converged = 1;
    phiset={};
    model.alpha=0.7;
    while (((converged < 0) || (converged > param.EM_CONVERGED) || (i <= 2)) && (i <= param.EM_MAX_ITER))
        
        i=i+1;
        disp([' em iteration: ' num2str(i)]);
        likelihood = 0;
        ss=zero_initialize_ss(ss, model);
        dw=zeros(1,corpus.nd);
        % E-step
        for d=1:corpus.nd
            
            if (mod(d,2) == 0)
                disp(d)
            end
            [l ss var_gamma(d,:) phi]=doc_e_step(corpus.docs{d},var_gamma(d,:),phi,model,ss);
            if(l>0)
                l=l;
            end
            phiset{d,1}=phi;
            dw(d)=l;
            likelihood = likelihood+l;
            
        end
        bar(dw)
        axis([0 22 0 3e4])
        pause(0.1)
        % M-step
        [model ss]=lda_mle(model, ss, model.alpha);
        
        % check for convergence
        
        converged = (likelihood_old - likelihood) / (likelihood_old);
        if (converged < 0)
        %    param.VAR_MAX_ITER = param.VAR_MAX_ITER * 2;
        end
        likelihood_old = likelihood;
        LK(i)=likelihood;
        disp(likelihood)
        %pause
        % output model and likelihood
        
    end

        
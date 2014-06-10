function alpha=opt_alpha(ss,D,K)
init_a=100*rand;
log_a=log(init_a);
iter=0;
MAX_ALPHA_ITER=1e3;
NEWTON_THRESH=1e-5;

while 1
     iter=iter+1;
     a=exp(log_a);
     if(isnan(a))
	  init_a=init_a*10;
          disp(['warning: alpha is nan, new init is ' num2str(init_a)])
          a=init_a;
          log_a=log(a);
     end %what's the relationship between the value of a and the          %convergence & the possible of nan
     f=alhood(a,ss,D,K);
     df=d_alhood(a,ss,D,K);
     d2f=d2_alhood(a,D,K);
     log_a=log_a-df/(d2f*a+df);
     disp(['alpha maximization' num2str(f) ',' num2str(df) ',' num2str(iter)])
     if((abs(df) < NEWTON_THRESH) || (iter > MAX_ALPHA_ITER))
            alpha=exp(log_a);
            %debug version
            a=0.01:0.01:1;
            fs=alhood(a,ss,D,K);
            plot(a,fs,'r')
            hold on
            plot(alpha,alhood(alpha,ss,D,K),'b*')
            hold off
            return
     end
end


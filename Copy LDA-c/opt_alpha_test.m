function alpha=opt_alpha_test(ss,D,K)
init_a=100*rand;
log_a=log(init_a);
iter=0;
MAX_ALPHA_ITER=1e3;
NEWTON_THRESH=1e-5;
t=1;
while 1
     iter=iter+1;
     a=exp(log_a);
     if(isnan(a) || a<1e-6)
         t=t+1;
	  init_a=init_a*t;
          disp(['warning: alpha is nan, new init is ' num2str(init_a)])
          a=init_a;
          log_a=log(a);
     end %what's the relationship between the value of a and the          %convergence & the possible of nan
     disp(['start point: ' num2str(a)])
            
     f=alhood(a,ss,D,K);
     disp(['the function value: ' num2str(f)])
     df=d_alhood(a,ss,D,K);
     disp(['the derviation value ' num2str(df)])
     d2f=d2_alhood(a,D,K);
     disp(['the hessian matrix value ' num2str(d2f)])
     if(a<1)
     log_a=log_a-df/(d2f*a+df);
     else
     w=df/(d2f*a+df);
     if(a-w<0)
         t=t+1;
         a=t*100*rand;
     else
     a=a-w;
     end
     
     disp(['the real a: ' num2str(a)])
     log_a=log(a);
     end
     disp(['log_a value: ' num2str(log_a)])
     disp(['pace: ' num2str(df/(d2f*a+df))])
%      ap=0.01:0.1:10;
%      fs=alhood(ap,ss,D,K);
%             plot(ap,fs,'r')
%             hold on
%            disp(['go to point: ' num2str(exp(log_a))])
%             plot(exp(log_a),alhood(exp(log_a),ss,D,K),'b*')
%             hold off
            %pause(0.001)
            
     disp(['alpha maximization' num2str(f) ',' num2str(df) ',' num2str(iter)])
     if((abs(df) < NEWTON_THRESH) || (iter > MAX_ALPHA_ITER))
            alpha=exp(log_a);
            %debug version

            return
     end
end


function v=log_sum(log_a,log_b)

if(log_a<log_b)

      v = log_b+log(1 + exp(log_a-log_b));
 else
      v = log_a+log(1 + exp(log_b-log_a));
end
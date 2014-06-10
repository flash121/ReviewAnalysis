function model=new_lda_model(nw,K)

%   model:
%           K - Number of Topics
%           nw - Number of terms
%           alpha - alpha paramter
%           log_prob_w - log-scale beta 
%                       WHERE alpha, beta IS THE SAME APPEARED IN BLEI 2003


model.K=K;
model.nw=nw;
model.alpha=1;
model.log_prob_w=zeros(K,nw);


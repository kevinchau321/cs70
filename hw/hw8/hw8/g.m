heads = 0;
tails = 0;
p =  .7;       %%probability of heads
m = 1000;

for k = [10 100 1000 4000]
    S_k= [];
    for j = 1:m
        heads = 0;
        tails = 0;
        for i = 1:k        %%k = 10
            if rand <= p
                heads = heads + 1;
            else 
                tails = tails + 1;
            end
        end
        S_k = [S_k (heads-k*p)/sqrt(k)];
    end
    S_k
    figure
    hist(S_k,25)
end
 
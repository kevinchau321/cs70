for p = [.7]
heads = 0;
tails = 0;
m = 1000;

for k = [10 100 1000 4000]
    S_k= [];
    for j = 1:m
        heads = 0;
        tails = 0;
        for i = 1:k      
            if rand <= p
                heads = heads + 1;
            else 
                tails = tails + 1;
            end
        end
        S_k = [S_k (heads-k*p)/(sqrt(k)*sqrt((p*(1-p))))];
    end
    S_k;
    figure
    hist(S_k)
   
end
end
 
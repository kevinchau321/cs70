heads = 0;
tails = 0;
p =  .7;       %%probability of heads
m = 1000;

S_k= [];
    for j = 1:m
        heads = 0;
        tails = 0;
        for i = 1:10        %%k = 10
            if rand <= p
                heads = heads + 1;
            else 
                tails = tails + 1;
            end
        end
        S_k = [S_k heads];
    end
 S_k
 figure
 hist(S_k,[0 1 2 3 4 5 6 7 8 9 10])
 
 S_k= [];
    for j = 1:m
        heads = 0;
        tails = 0;
        for i = 1:100       %%k = 100
            if rand <= p
                heads = heads + 1;
            else 
                tails = tails + 1;
            end
        end
        S_k = [S_k heads];
    end
 S_k
 figure
 hist(S_k)
 
 S_k= [];
    for j = 1:m
        heads = 0;
        tails = 0;
        for i = 1:1000      %%k = 1000
            if rand <= p
                heads = heads + 1;
            else 
                tails = tails + 1;
            end
        end
        S_k = [S_k heads];
    end
 S_k
 figure
 hist(S_k)
 
 S_k= [];
    for j = 1:m
        heads = 0;
        tails = 0;
        for i = 1:4000      %%k = 4000
            if rand <= p
                heads = heads + 1;
            else 
                tails = tails + 1;
            end
        end
        S_k = [S_k heads];
    end
 S_k
 figure
 hist(S_k)
 
 
 
 
 
 



heads = 0;
tails = 0;
p =  .7;       %%probability of heads

for k = [10,100,1000, 4000];
    heads = 0;
    tails = 0;
    figure
    for i = 1:k
        if rand <= p
            heads = heads + 1;
        else 
            tails = tails + 1;
        end
    end
    heads
    tails
    bar([heads tails])
    set(gca,'xticklabel',{'heads'; 'tails'})
end


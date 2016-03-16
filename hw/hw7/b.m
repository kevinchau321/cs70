
headtotals = [];
tailtotals = [];

for j = 1:1000
    heads = 0;
    tails = 0;
    for i= 1:1000
        if rand < .5
            heads = heads + 1;
        else 
            tails = tails + 1;
        end
    end
    headtotals = [headtotals heads];
    tailtotals = [tailtotals tails];
end

headtotals
tailtotals;

figure
hist(headtotals);


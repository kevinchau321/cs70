figure;
q = .4;
m = 10000;
for k = 1:1000;
frequency =0;
    for j = 1:m;   
        heads = 0;
        headsfraction = 0;
        for i = 1:k;
            if rand < .5        %%heads
                heads = heads + 1;
            end
        end
        headsfraction = heads/k;
        if headsfraction <= q
            frequency = frequency + 1;
        end
    end
scatter(k,frequency/m,5,[1 0 0]);       %%red
hold all;
end


set(gca,'YScale','log');
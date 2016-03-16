figure;
for j = 1:20;




cointotal = 0;
coinarray = [];
for i = 1:1000
    if rand < .5        %%heads
       cointotal = cointotal + 1;
       coinarray = [coinarray cointotal];
    else 
       cointotal = cointotal - 1;
       coinarray = [coinarray cointotal];
    end
end

plot(1:1000,coinarray);

hold all;

end;
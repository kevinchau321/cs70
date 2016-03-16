figure;
for j = 1:100;

tosses = 0;
cointotal = 0;
coinarray = [];
for i = 1:1000;
    tosses = tosses + 1;
    if rand < .5        %%heads
       cointotal = cointotal + 1;
       coinarray = [coinarray cointotal/tosses];
    else 
       cointotal = cointotal - 1;
       coinarray = [coinarray cointotal/tosses];
    end
end
coinarray
plot(1:1000,coinarray);

hold all;

end;
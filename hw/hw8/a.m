heads = 0;
tails = 0;
p =  .7;       %%probability of heads
k = 1000;        %%%number of flips

for i= 1:k
  if rand <= p
      heads = heads + 1;
  else 
      tails = tails + 1;
  end
end

heads
tails

figure
bar([heads tails])
set(gca,'xticklabel',{'heads'; 'tails'})
hold;

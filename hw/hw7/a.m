heads = 0;
tails = 0;

for i= 1:1000
  if rand < .5
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


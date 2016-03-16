%%%%%%%%%%%%%%%%%%%%% CS 70 Spring 2014 %%%%%%%%%%%%%%%%%%%
%%% Solutions to Problem 1 (Virtual Lab) for Homework 9 %%%
%%%%%%%%%%%%%%%%%% Written by Kevin Chau %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p_vec = [0.9 0.6 0.5 0.4 0.3 0.2]; 
d_vec = linspace(-3,3,10);
M = 1000; colors = {'black','blue','red','green','magenta','cyan'}; 
k_vec = [10 100 1000 4000]; 


for i = 1:length(k_vec)
    for j = 1:length(p_vec)
        coin = zeros(M,1); 
        S_k_normal = zeros(M,1); 
        for m = 1:M
            r = rand(k_vec(i),1);
            coin(m,1) = sum(r <= p_vec(j));
            S_k_normal(m,1) = (coin(m,1)-k_vec(i)*p_vec(j))./sqrt(k_vec(i)*p_vec(j)*(1-p_vec(j))); 
        end
        data = zeros(length(d_vec),1); 
        subplot(2,2,i);
        for a = 1:length(d_vec)
            data(a,1) = sum(S_k_normal < d_vec(a));
        end
        data = data./length(S_k_normal); 
        plot(d_vec,data,'Color',colors{j},'LineWidth',2.5); hold on; 
    end 
    x = linspace(-3,3,10);
    y = int(erf(y),y,-Inf,x); hold on;
    plot(d_vec, y);
    h = legend('p = 0.9','p = 0.6','p = 0.5','p = 0.4','p = 0.3','p = 0.2','Location','NorthWest');
    set(gca,'XLim',[-4 4],'YLim',[0 1]); 
    set(h,'FontSize',10); 
    xlabel('d'); ylabel('P(x < d)'); 
    title(['k = ' num2str(k_vec(i))]);
    
end
set(gcf,'PaperUnits','inches','PaperSize',[12,12],'PaperPosition',[0 0 12 12]);
print('-dpng','-r100','part_a');


function k();
    for p = [.7 .9 .6 .5 .4 .3] 
        do_p(p);
    end
end




function out = flip_coin_k_times_fraction (k,p)
    
    % flip an biased coin k times, 
    % return fraction of heads
    
    out = 0;
    for idx = 1:1:k
        out = out + (rand() <= p);
    end

    out = out/k;

end



function out = flip_coin_k_times_n_times_fraction (n, k,p)
    
    % run flip_coin_k_times_fraction n times
    
    out = zeros(n, 1);
    for idx = 1:1:n
        out(idx, 1) = flip_coin_k_times_fraction(k,p);
    end

end



function out = do_p (p)

    n = 10000;

    ks = [100, 1000, 4000];
    nks = size(ks, 2);
    
    qs = 0:0.01:1;
    nqs = size(qs, 2);
   
    figure();
    hs = [];
    ls = {};

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k, p);

        ys = zeros(1, nqs);
        for qidx = 1:1:nqs
            q = qs(1, qidx);
            ys(1, qidx) = size(find(head_fractions <= q),1) / n;
        end
        h = plot((qs-p)*sqrt(k)*sqrt(p*(1-p))+p, ys);
        hold all;
        hs = [hs, h];
        ls = [ls, ['k = ', num2str(k)]];
        axis([p-1.5 p+1.5 0 1])

    end

    legend(hs, ls);

end

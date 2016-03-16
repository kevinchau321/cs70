function i()
    do_o();
end

function out = flip_coin_k_times_fraction (k, p)
    
    % flip a biased coin k times, 
    % return fraction of heads
    
    out = 0;
    for idx = 1:1:k
        out = out + (rand() <= p);
    end

    out = out/k;

end

function out = flip_coin_k_times_n_times_fraction (n, k, p)
    
    % run flip_coin_k_times_fraction n times
    
    out = zeros(n, 1);
    for idx = 1:1:n
        out(idx, 1) = flip_coin_k_times_fraction(k,p);
    end

end
function out = do_o (p)
    figure
    hold all
    ps = [.9 .6 .5 .4 .3];
    yys = [];
    for p = [.9 .6 .5 .4 .3]

    n = 10000;

    ks = [1000];
    nks = size(ks, 2);
    
    qratios = [0.25, 0.5, 0.75];
    nqrs = size(qratios, 2);

    qmarkers = zeros(nks, nqrs);

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k , p);
        
        sorted_head_fractions = sort(head_fractions);
        for qridx = 1:1:nqrs
            qr = qratios(1, qridx);
            qmarkers(kidx, qridx) = sorted_head_fractions(ceil(qr*n), 1);
        end

    end

    ys = (qmarkers(:,3) - qmarkers(:,1))';
    yys =[yys ys];
    end
    yys
    log(yys)

    scatter(log(ps.*(1-ps)), log(yys));
    title('Log-Log')
    
end
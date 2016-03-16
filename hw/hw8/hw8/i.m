function i()
    for p = [.9 .6 .5 .4 .3]
        do_o(p);
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

function out = do_m (p)

    n = 10000;

    ks = [1000];
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
        h = plot(qs, ys);
        hold all;
        hs = [hs, h];
        ls = [ls, ['k = ', num2str(k)]];

    end

    legend(hs, ls);

end


function out = do_n (p)

    n = 10000;

    ks = [1000];
    nks = size(ks, 2);
    
    qratios = [0.25, 0.5, 0.75];
    nqrs = size(qratios, 2);

    qmarkers = zeros(nks, nqrs);

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k, p);
        
        sorted_head_fractions = sort(head_fractions);
        for qridx = 1:1:nqrs
            qr = qratios(1, qridx);
            qmarkers(kidx, qridx) = sorted_head_fractions(ceil(qr*n), 1);
        end

    end

    figure();
    hs = [];
    ls = {};

    for qridx = 1:1:nqrs
        h = plot(ks', qmarkers(:,qridx));
        hold all;
        hs = [hs, h];
        ls = [ls, ['quartile = ', num2str(qratios(1,qridx))]];
    end

    legend(hs, ls);

end

function out = do_o (p)

    n = 10000;

    ks = [1000];
    nks = size(ks, 2);
    
    qratios = [0.25, 0.5, 0.75];
    nqrs = size(qratios, 2);

    qmarkers = zeros(nks, nqrs);

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k, p);
        
        sorted_head_fractions = sort(head_fractions);
        for qridx = 1:1:nqrs
            qr = qratios(1, qridx);
            qmarkers(kidx, qridx) = sorted_head_fractions(ceil(qr*n), 1);
        end

    end

    figure();
    
    xs = ks;
    ys = (qmarkers(:,3) - qmarkers(:,1))';
    
    subplot(2, 2, 1);
    plot(xs, ys);
    title('Linear-Linear')

    subplot(2, 2, 2);
    plot(xs, log(ys));
    title('Linear-Log')

    subplot(2, 2, 3);
    plot(log(xs), ys);
    title('Log-Linear')

    subplot(2, 2, 4);
    plot(log(xs), log(ys));
    title('Log-Log')

end
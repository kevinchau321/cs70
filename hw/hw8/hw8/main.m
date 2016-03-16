
function main()

    % this file has a bunch of MATLAB functions
        % named do_a, do_b, etc. up to do_p
        % corresponding to the p parts of the homework problem
    
    % this is the main() function
        % it just calls the above functions do_a, do_b, etc.
        % note that some of these calls may be commented below
        % uncomment these lines to run the corresponding functions
            % e.g., if you want to view the output for part d, uncomment 
            % the line that says "do_d();" below

    % do_a();
    % do_b();
    do_c();
    % do_d();
    % do_e();
    % do_f();
    % do_h();
    % do_i();
    % do_j();
    % do_k();
    % do_l();
    % do_m();
    % do_n();
    % do_o();
    % do_p();

end


function out = flip_coin_k_times (k)
    
    % flip an unbiased coin k times, 
    % return outcome as vector of -1s and 1s
    
    out = zeros(1, k);
    for idx = 1:1:k
        out(1, idx) = 2*(rand() >= 0.5) - 1;
    end

end


function out = flip_coin_k_times_fraction (k)
    
    % flip an unbiased coin k times, 
    % return fraction of heads
    
    out = 0;
    for idx = 1:1:k
        out = out + (rand() >= 0.5);
    end

    out = out/k;

end


function out = flip_coin_k_times_n_times (n, k)
    
    % run flip_coin_k_times n times
    
    out = zeros(n, k);
    for idx = 1:1:n
        out(idx, :) = flip_coin_k_times(k);
    end

end


function out = flip_coin_k_times_n_times_fraction (n, k)
    
    % run flip_coin_k_times_fraction n times
    
    out = zeros(n, 1);
    for idx = 1:1:n
        out(idx, 1) = flip_coin_k_times_fraction(k);
    end

end


function out = do_a ()
    
    tosses = flip_coin_k_times (1000);

    figure();
    hist(tosses, 2);

end


function out = do_b ()

    n = 1000; k = 1000;
    tosses = flip_coin_k_times_n_times(n, k);
    
    nheads = zeros(n, 1);
    for idx = 1:1:n
        nheads(idx, 1) = size(find(tosses(idx, :) > 0), 2);
    end

    figure();
    hist(nheads);

end


function out = do_c ()

    n = 1000; 
    ks = [2, 4, 10, 50, 100, 500, 10000, 100000];

    nbins = 50;
    for k = ks
        tosses = flip_coin_k_times_n_times(n, k);
        
        nheads = zeros(n, 1);
        for idx = 1:1:n
            nheads(idx, 1) = size(find(tosses(idx, :) > 0), 2);
        end

        figure();
        hist(nheads, nbins);
    end

end


function out = do_d ()

    n = 1000; 
    ks = [2, 4, 10, 50, 100, 500, 10000, 100000];

    figure();
    kidx = 0;

    for k = ks
        
        kidx = kidx + 1;
        tosses = flip_coin_k_times_n_times(n, k);
        
        nheads = zeros(n, 1);
        for idx = 1:1:n
            nheads(idx, 1) = size(find(tosses(idx, :) > 0), 2);
        end
        
        subplot(size(ks, 2), 1, kidx);
        hist(nheads-0.5*k);
    end

end


function out = do_e ()

    n = 1000; 
    ks = [2, 4, 10, 50, 100, 500, 10000, 100000];

    figure();
    kidx = 0;

    for k = ks
        
        kidx = kidx + 1;
        tosses = flip_coin_k_times_n_times(n, k);
        
        nheads = zeros(n, 1);
        for idx = 1:1:n
            nheads(idx, 1) = size(find(tosses(idx, :) > 0), 2);
        end
        
        subplot(size(ks, 2), 1, kidx);
        hist(nheads - 0.5*k, (-1000:10:1000)');
    end

end


function out = do_f ()

    n = 1000; 
    ks = [2, 4, 10, 50, 100, 500, 10000, 100000];

    figure();
    kidx = 0;

    for k = ks
        
        kidx = kidx + 1;
        tosses = flip_coin_k_times_n_times(n, k);
        
        nheads = zeros(n, 1);
        for idx = 1:1:n
            nheads(idx, 1) = size(find(tosses(idx, :) > 0), 2);
        end
        
        subplot(size(ks, 2), 1, kidx);
        hist((nheads - 0.5*k)/(0.5*k), (-1:0.01:1)');
    end

end

function out = do_h ()

    k = 1000;
    n = 20;

    figure();

    xs = 0:1:k;
    for idx = 1:1:n
        
        tosses = flip_coin_k_times (k);
        
        ys = zeros(1, k+1);

        for idx2 = 2:1:(k+1)
            ys(1,idx2) = ys(1,idx2-1) + tosses(1,idx2-1);
        end
        
        plot(xs, ys);
        hold all;
    end

end

function out = do_i ()

    k = 1000;
    n = 100;

    figure();

    xs = 1:1:k;
    for idx = 1:1:n
        
        tosses = flip_coin_k_times (k);
        
        nheads_so_far = 0;
        ys = zeros(1, k);

        for idx2 = 1:1:k
            if tosses(1, idx2) > 0
                nheads_so_far = nheads_so_far + 1;
            end
            ys(1,idx2) = nheads_so_far/idx2;
        end
        
        plot(xs, ys);
        hold all;
    end

end


function out = do_j ()

    n = 10000; k = 1000;
    tosses = flip_coin_k_times_n_times(n, k);

    head_fractions = zeros(n, k);
    for idx1 = 1:1:n
        nheads_so_far = 0;
        for idx2 = 1:1:k
            if tosses(idx1, idx2) > 0
                nheads_so_far = nheads_so_far + 1;
            end
            head_fractions(idx1,idx2) = nheads_so_far/idx2;
        end
    end
    
    qs = [0.1, 0.25, 0.4, 0.5];
    
    figure();
    xs = 1:1:k;
    hs = [];
    ls = {};
    for qidx = 1:1:size(qs, 2)
        q = qs(1, qidx);
        ys = zeros(1, k);

        for kidx = 1:1:k
            ys(1, kidx) = size(find(head_fractions(:,kidx) <= q),1) / n;
        end

        h = scatter(xs, ys);
        ylim([0, 1]);
        hold all;
        hs = [hs, h];
        ls = [ls, ['q = ', num2str(q)]];
    end

    legend(hs, ls);

end


function out = do_k ()

    n = 10000; k = 1000;
    tosses = flip_coin_k_times_n_times(n, k);

    head_fractions = zeros(n, k);
    for idx1 = 1:1:n
        nheads_so_far = 0;
        for idx2 = 1:1:k
            if tosses(idx1, idx2) > 0
                nheads_so_far = nheads_so_far + 1;
            end
            head_fractions(idx1,idx2) = nheads_so_far/idx2;
        end
    end
    
    qs = [0.1, 0.25, 0.4, 0.5];
    
    figure();
    xs = 1:1:k;
    hs = [];
    ls = {};
    for qidx = 1:1:size(qs, 2)
        q = qs(1, qidx);
        ys = zeros(1, k);

        for kidx = 1:1:k
            ys(1, kidx) = size(find(head_fractions(:,kidx) <= q),1) / n;
        end

        h = scatter(xs, log(ys));
        hold all;
        hs = [hs, h];
        ls = [ls, ['q = ', num2str(q)]];
    end

    legend(hs, ls);

end


function out = do_l ()

    n = 10000; k = 1000;
    tosses = flip_coin_k_times_n_times(n, k);

    head_fractions = zeros(n, 1);
    for idx1 = 1:1:n
        nheads_so_far = 0;
        for idx2 = 1:1:k
            if tosses(idx1, idx2) > 0
                nheads_so_far = nheads_so_far + 1;
            end
        end
        head_fractions(idx1,1) = nheads_so_far/k;
    end
    
    qs = 0:0.01:1;
    nqs = size(qs, 2);
    
    figure();
    ys = zeros(1, nqs);
    for qidx = 1:1:nqs
        q = qs(1, qidx);
        ys(1, qidx) = size(find(head_fractions <= q),1) / n;
    end
    h = plot(qs, ys);

end


function out = do_m ()

    n = 10000;

    ks = [2, 10, 50, 100, 500, 10000, 100000];
    nks = size(ks, 2);
    
    qs = 0:0.01:1;
    nqs = size(qs, 2);
   
    figure();
    hs = [];
    ls = {};

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k);

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


function out = do_n ()

    n = 10000;

    ks = [10, 50, 100, 500, 10000, 100000];
    nks = size(ks, 2);
    
    qratios = [0.25, 0.5, 0.75];
    nqrs = size(qratios, 2);

    qmarkers = zeros(nks, nqrs);

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k);
        
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


function out = do_o ()

    n = 10000;

    ks = [10, 50, 100, 500, 10000, 100000];
    nks = size(ks, 2);
    
    qratios = [0.25, 0.5, 0.75];
    nqrs = size(qratios, 2);

    qmarkers = zeros(nks, nqrs);

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k);
        
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


function out = do_p ()

    n = 10000;

    ks = [2, 10, 50, 100, 500, 10000, 100000];
    nks = size(ks, 2);
    
    qs = 0:0.01:1;
    nqs = size(qs, 2);
   
    figure();
    hs = [];
    ls = {};

    for kidx = 1:1:nks

        k = ks(1, kidx);
        head_fractions = flip_coin_k_times_n_times_fraction(n, k);

        ys = zeros(1, nqs);
        for qidx = 1:1:nqs
            q = qs(1, qidx);
            ys(1, qidx) = size(find(head_fractions <= q),1) / n;
        end
        h = plot((qs-0.5)*sqrt(k)+0.5, ys);
        hold all;
        hs = [hs, h];
        ls = [ls, ['k = ', num2str(k)]];

    end

    legend(hs, ls);

end


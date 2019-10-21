% This script produces the illustrations for theorem 2

close all
clear all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Model's parameters: Generate a random Chung-Lu graph with average degree d, max degree m, and power-law degree distribution with exponent gamma

n = 1e4;
gamma = 2.8;
m = sqrt(n); %%% n^(1/(gamma-1));
d = 10;
p = 1/(gamma-1);
c = (1-p)*d*n^p;
i0 = (c/m)^(1/p) - 1;
w = c./((1:n)+i0).^p;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ntrial = 50;    % number of random trials
acc = 0;
for trial = 1:ntrial
    A = CL_generator(w); 
    deg = sum(A);
    acc = acc + deg;
end
deg = acc/ntrial;
h = histcounts(deg,1:ceil(max(deg)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   

figure(1)
subplot(1,2,1)
loglog(deg,'.','markersize',13)
hold on
loglog(w,'linewidth',2)
hold off
set(gca, 'fontsize', 12);
legend('actual','$w_i$','interpreter','latex','fontsize',12,'location','southwest')
xlabel('node index $i$','fontsize',15,'interpreter','latex')
ylabel('degree','fontsize',15,'interpreter','latex')


subplot(1,2,2)
loglog(h,'.','markersize',13)
hold on
theory = (1:max(deg)).^(-gamma);
loglog((gamma-1)/(c^(1-gamma))*theory,'-','linewidth',2)
hold off
set(gca, 'fontsize', 12);
xlabel('$k$','interpreter','latex','fontsize',15)
ylabel('$n(k)$', 'interpreter','latex','fontsize',15)
xlim([min(w) max(w)])
legend('actual','$\alpha k^{-\gamma}$','interpreter','latex','fontsize',12,'location','southwest') 




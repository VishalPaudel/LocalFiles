% Monte Carlo Simulation of Compound Poisson process
t = 3; lambda = 5; N = 10^6;
beer = zeros(N,1); beer_price = 350;
for i = 1:N
n = poissrnd(lambda * t);
if n~=0
coins = zeros(n,1);
for j = 1:n
U = rand;
coins(j) = (U <= 2/5)*5 + ...
(U > 2/5 && U <= 4/5)*10 + (U > 4/5)*20;
end
end
beer(i) = (sum(coins) >= beer_price);
end
l_hat = mean(beer) % l_hat = P(X3 >= beer_price)
relErr_hat = std(beer) / (l_hat * sqrt(N))
% relative error of l_hat by crude Monte Carlo simulation

for x = 1:100
    if (x >= 0 && x < 54)
         y = (5*10^(-6)*x^3) + (7*10^(-5)*x^2) + (0.002*x) + 0.0011;
    else
        y = 1;
    end
    the_result(x) = y;
end

plot((1:100), the_result);
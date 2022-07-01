
function [viterbi_prob, viterbi_path] = ViterbiSolver(S_name, O_name, observed_Y, pi, P, E)
    % A faster algorithm, to predict the most likely sequence of steps
    % Given the knowledge of some observations
    % with a good time complexity but bad space complexity

    % Code Begins
    format long;
    
    S = (1:length(S_name));
    % O = (1:length(O_name));
    Y = zeros(1, length(observed_Y));
    
    K = length(S);
    T = length(Y);
    
    for i = (1: T)
    
        Y(1, i) = find(O_name==observed_Y(1, i));
        
    end
    
    
    viterbi_prob = zeros(K, T);
    viterbi_path = zeros(K, T);
    
    
    % Initialisation
    for i = (1: K)
        
        viterbi_prob(i, 1) = pi(1, i) * E(i, Y(1, 1));
        viterbi_path(i, 1) = 0;
    end
    
    
    % Compute Viterbi probabilities and Viterbi path
    for j = (2: T)
        
        for i = (1: K)
    
            [viterbi_prob(i, j), viterbi_path(i, j)] = max(E(i, Y(1, j)) .* P((1:K), i) .* viterbi_prob((1:K), j - 1));
        end
    end

    [~, z(T)] = max(viterbi_prob((1:K), T));
    X(T) = S(z(T));
    

    % Back - Tracing
    for j = (T:-1:2)
        
        z(j - 1) = viterbi_path(z(j), j);
        X(1, j-1) = S(z(j - 1));
    end
    

    % Displaying the most probable path
    disp("Displaying the most probable path:")
    for i = (1: T)
        if i == 1
    
            fprintf("Start-- %s --", S_name(1, X(1, i)))
    
        elseif i == T
    
            fprintf("-- %s --End\n", S_name(1, X(1, i)))
    
        else
    
            fprintf("-- %s --", S_name(1, X(1, i)))
    
        end
    
        
    
    end

end

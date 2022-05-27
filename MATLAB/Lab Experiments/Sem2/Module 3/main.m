
clc
clear
close all

% Billoo
S_name = ["rainy" "sunny"];
O_name = ["walking" "shopping" "cleaning"];
observed_Y = ["walking" "walking" "shopping" "walking" "cleaning"];

pi = [0.43, 0.57];

P = [0.2 0.8; 0.4 0.6];

E = [0.2 0.4 0.4; 0.3 0.25 0.45];

[viterbi_prob, viterbi_path] = ViterbiSolver(S_name, O_name, observed_Y, pi, P, E);
fprintf("The viterbi probability matrix is:\n")
disp(viterbi_prob)

fprintf("The viterbi path matrix is:\n")
disp(viterbi_path)

% Aeroplane
S_name = ["normal" "alternate" "direct"];
O_name = ["up" "down"];
observed_Y = ["up", "down", "down", "down", "down", "up", "up", "down", "down", "down", "down"];

pi = [0.8 0.1 0.1];

P = [0.7 0.1 0.2; 0.4 0.5 0.1; 0.2 0.3 0.5];

E = [0.6 0.4; 0.3 0.7; 0.2 0.8];

[viterbi_prob, viterbi_path] = ViterbiSolver(S_name, O_name, observed_Y, pi, P, E);
fprintf("The viterbi probability matrix is:\n")
disp(viterbi_prob)

fprintf("The viterbi path matrix is:\n")
disp(viterbi_path)


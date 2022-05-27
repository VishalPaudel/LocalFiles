clc
clear all;
close all;

%Question 2{up= 1, down= 2}
 pi= [0.8 0.1 0.1];                      %Initial State Distribution 
 P= [0.7 0.1 0.2; 0.4 0.5 0.1; 0.2 0.3 0.5];        %Transition state matrix
 E= [0.6 0.4; 0.3 0.7; 0.2 0.8];         %Emisssion Matrix
 S= ["Normal", "Alternate", "Direct"];
 Y= [1 2 2 2 2 1 1 2 2 2 2];             %Order as given in the question

T=size(Y, 2);                            % Time of observations
K= size(S, 2);

for i=1:K
    viterbi_prob(i,1) = pi(1, i)*E(i,Y(1, i));
    viterbi_path(i,1) = 0;
end

for j=2:T
    for i=1:K
        for a=1:K
            arr(a) = E(i,Y(j))*P(a,i)*viterbi_prob(a,j-1);
        end
        [viterbi_prob(i,j),viterbi_path(i,j)]= max(arr);
        
    end      
end
for a=1:K
    b(a)=viterbi_prob(a,T);
end
[null,z(j)]=max(b);
X(T)=S(z(T));


for j=T:-1:2
    z(j-1) = viterbi_path(z(j),j);
    X(j-1)=S(z(j-1));
end
disp('Viterbi Probability is');
disp(viterbi_prob);
disp('Viterbi Path is');
disp(viterbi_path);
X
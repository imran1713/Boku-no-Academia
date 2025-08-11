clc;
clear all;

% Define system matrices
A = [2 0 1 ; 0 0 5 ; 8 2 0];
B = [0 ; 5 ; 8];
C = [1 1 1];

% not controllable but observable
% A = [-1 0 0; 0 -2 0; 0 0 -3];
% B = [1; 1; 0];
% C = [1 1 1];

% Controllability matrix
Co = ctrb(A, B);
rank_Co = rank(Co);

% Observability matrix
Ob = obsv(A, C);
rank_Ob = rank(Ob);

% Display results
disp('Controllability Matrix:');
disp(Co);
disp(['Rank of Controllability Matrix: ', num2str(rank_Co)]);

disp('Observability Matrix:');
disp(Ob);
disp(['Rank of Observability Matrix: ', num2str(rank_Ob)]);

% disp(num2str(A.'))

% Check full rank
n = size(A, 1); % number of states

if rank_Co == n
    disp('✅ The system is CONTROLLABLE.');
else
    disp('❌ The system is NOT CONTROLLABLE.');
end

if rank_Ob == n
    disp('✅ The system is OBSERVABLE.');
else
    disp('❌ The system is NOT OBSERVABLE.');
end



% Clear workspace and command window
clear all;
clc;
close all;

% Define time vector
n = -10:20;  % Sample indices

% 1. Generate Unit Impulse Signal
delta = zeros(size(n));
delta(n == 0) = 1;  % Impulse at n=0

% 2. Generate Unit Step Signal
u = zeros(size(n));
u(n >= 0) = 1;  % Step function

% 3. Generate Ramp Signal
r = zeros(size(n));
r(n >= 0) = n(n >= 0);  % Ramp function

% 4. Convert Unit Impulse to Unit Step (Cumulative Sum)
u_from_delta = cumsum(delta);

% 5. Convert Unit Step to Unit Impulse (Difference)
delta_from_u = [0, diff(u)];  % Add zero at beginning

% 6. Convert Unit Step to Ramp (Cumulative Sum)
r_from_u = cumsum(u);

% 7. Convert Ramp to Unit Step (Difference)
u_from_r = [0, diff(r)];  % Add zero at beginning

% Plotting
figure('Position', [100, 100, 1200, 800]);

% Original signals
subplot(3,3,1);
stem(n, delta, 'b', 'LineWidth', 2);
title('Unit Impulse Signal δ[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,3,2);
stem(n, u, 'r', 'LineWidth', 2);
title('Unit Step Signal u[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,3,3);
stem(n, r, 'g', 'LineWidth', 2);
title('Ramp Signal r[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

% Converted signals
subplot(3,3,4);
stem(n, u_from_delta, 'b--', 'LineWidth', 2);
title('Unit Step from Impulse');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,3,5);
stem(n, delta_from_u, 'r--', 'LineWidth', 2);
title('Unit Impulse from Step');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,3,6);
stem(n, r_from_u, 'g--', 'LineWidth', 2);
title('Ramp from Step');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(3,3,7);
stem(n, u_from_r, 'm', 'LineWidth', 2);
title('Unit Step from Ramp');
xlabel('n'); ylabel('Amplitude');
grid on;

% Display signal values
fprintf('Signal Values at key points:\n');
fprintf('n = -2, -1, 0, 1, 2, 3, 4, 5\n');
fprintf('Delta: '); fprintf('%d ', delta(n >= -2 & n <= 5)); fprintf('\n');
fprintf('Step:  '); fprintf('%d ', u(n >= -2 & n <= 5)); fprintf('\n');
fprintf('Ramp:  '); fprintf('%d ', r(n >= -2 & n <= 5)); fprintf('\n');



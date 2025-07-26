
% Signal Operations Lab - LR2
clear all; close all; clc;

% Create single figure with 3 columns for all tasks
figure(1);
set(gcf, 'Position', [100, 100, 1200, 800]); % Make figure larger

% 1. Sin(x) - Folding Operation x(-n) - Column 1
n = -10:10;  % discrete time indices
x_sin = sin(n);
x_sin_folded = sin(-n);  % x(-n)

% Original sin(n) - Top left
subplot(3,3,1);
stem(n, x_sin, 'bo-', 'LineWidth', 2, 'MarkerSize', 6);
title('Task 1: Original sin(n)');
xlabel('n'); ylabel('sin(n)');
grid on;

% Folded sin(-n) - Bottom left
subplot(3,3,4);
stem(n, x_sin_folded, 'ro-', 'LineWidth', 2, 'MarkerSize', 6);
title('Folded sin(-n)');
xlabel('n'); ylabel('sin(-n)');
grid on;

% 2. Cos(x) - Shifting Operation (n-2) - Column 2
x_cos = cos(n);
% For shifting (n-2), we need to create shifted indices
n_shifted = n + 2;  % shift the time axis
x_cos_shifted = cos(n);  % x(n-2) means the signal appears 2 samples later

% Original cos(n) - Top middle
subplot(3,3,2);
stem(n, x_cos, 'bo-', 'LineWidth', 2, 'MarkerSize', 6);
title('Task 2: Original cos(n)');
xlabel('n'); ylabel('cos(n)');
grid on;

% Shifted cos(n-2) - Bottom middle
subplot(3,3,5);
stem(n_shifted, x_cos_shifted, 'go-', 'LineWidth', 2, 'MarkerSize', 6);
title('Shifted cos(n-2)');
xlabel('n'); ylabel('cos(n-2)');
grid on;

% 3. Discrete Signal x(n) = {1, 2, 3, 0, 4, -3} - Rotating Operations - Column 3
% 3 is the center value (0th value), so indices should be -2 to 3
n_discrete = -2:3;  % indices for the given signal with 3 at n=0
x_discrete = [1, 2, 3, 0, 4, -3];

% Original signal - Top right
subplot(3,3,3);
stem(n_discrete, x_discrete, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
title('Task 3: Original x(n) [3 at n=0]');
xlabel('n'); ylabel('x(n)');
grid on;

% -x(-n) operation: fold then negate - Middle right
% For folding x(-n), we need to reverse both indices and values
n_folded = -fliplr(n_discrete);  % flip indices then negate: [3, 2, 1, 0, -1, -2]
x_folded = fliplr(x_discrete);   % flip the values: [-3, 4, 0, 3, 2, 1]
x_neg_folded = -x_folded;        % then negate: [3, -4, 0, -3, -2, -1]

subplot(3,3,6);
stem(n_folded, x_neg_folded, 'ro-', 'LineWidth', 2, 'MarkerSize', 8);
title('Rotated -x(-n)');
xlabel('n'); ylabel('-x(-n)');
grid on;

% -x(n) operation: just negate - Bottom right
x_negated = -x_discrete;

subplot(3,3,9);
stem(n_discrete, x_negated, 'go-', 'LineWidth', 2, 'MarkerSize', 8);
title('Negated -x(n)');
xlabel('n'); ylabel('-x(n)');
grid on;

% Add overall title
sgtitle('DSP Lab 2: Signal Operations - Folding, Shifting, and Rotating', 'FontSize', 16, 'FontWeight', 'bold');

% Display results
disp('Signal Operations Results:');
disp('========================');
disp(' ');
disp('1. Discrete Sine Signal:');
disp(['Original sin(n) at n=0: ', num2str(sin(0))]);
disp(['Folded sin(-n) at n=0: ', num2str(sin(0))]);
disp(' ');
disp('2. Discrete Cosine Signal:');
disp(['Original cos(n) at n=0: ', num2str(cos(0))]);
disp(['Shifted cos(n-2) appears at n=2: ', num2str(cos(0))]);
disp(' ');
disp('3. Discrete Signal x(n):');
disp(['n = ', num2str(n_discrete)]);
disp(['x(n) = ', num2str(x_discrete)]);
disp('Note: Center value 3 is at n=0');
disp(' ');
disp('Folded and negated signal -x(-n):');
disp(['n = ', num2str(n_folded)]);
disp(['-x(-n) = ', num2str(x_neg_folded)]);
disp('Step-by-step for -x(-n):');
disp(['  Original x(n): ', num2str(x_discrete), ' at n = ', num2str(n_discrete)]);
disp(['  Folded x(-n): ', num2str(x_folded), ' at n = ', num2str(n_folded)]);
disp(['  Negated -x(-n): ', num2str(x_neg_folded), ' at n = ', num2str(n_folded)]);
disp(' ');
disp('Negated signal -x(n):');
disp(['n = ', num2str(n_discrete)]);
disp(['-x(n) = ', num2str(x_negated)]);



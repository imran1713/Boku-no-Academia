### Experiment no.: 02
### Experiment name: Experiment on Controllability and Observability of a System
### Objectives:
• To understand the fundamental concepts of controllability and observability in linear time-invariant (LTI) systems
• To develop MATLAB programming skills for computing controllability and observability matrices using built-in functions
• To analyze system properties through rank determination of controllability and observability matrices
• To evaluate different system configurations and their impact on controllability and observability characteristics
• To investigate the relationship between system matrix parameters and control system design capabilities

### Theory:
Controllability and observability are fundamental concepts in modern control theory that determine the feasibility of control system design. 

**Controllability:**
A system is said to be controllable if an initial state $x(t_0)$ can be transferred to any desired final state $x_f$ in a finite time interval $(t_f - t_0)$, where $t \geq 0$, by some control input $u$. If each and every state of the system can be controlled by the input, then the system is called completely controllable.

For a system described by the state space equations $\dot{x} = Ax + Bu$ and $y = Cx$, where:
- $x$ = state vector
- $\dot{x}$ = derivative of state vector  
- $y$ = output vector
- $A$ = system matrix $(n \times n)$
- $B$ = input matrix $(n \times m)$
- $u$ = input vector (control input)
- $C$ = output matrix $(p \times n)$

**How to check controllability:**
A system is completely controllable if and only if the rank of the controllability matrix equals the number of state variables $(n)$.

The controllability matrix is defined as:

$$C_o = \begin{bmatrix} B & AB & A^2B & \cdots & A^{n-1}B \end{bmatrix}$$

where $n$ = number of state variables.

If rank(Controllability matrix) $< n$, then the system is not completely controllable.

**Observability:**
A system is said to be observable if every initial state $x(t_0)$ can be exactly determined from the measurement of the output $y$ over a finite time interval $0 \leq t \leq t_f$. If the internal states can be determined from the output measurements, then the system is called completely observable.

The observability matrix is defined as:

$$O_b = \begin{bmatrix} C \\ CA \\ CA^2 \\ \vdots \\ CA^{n-1} \end{bmatrix}$$

where:
- $C$ = output matrix $(p \times n)$
- $p$ = number of outputs
- $n$ = number of states

**Rank Analysis:**
Rank represents the number of linearly independent rows/columns in a matrix. For both controllability and observability, the rank of the respective matrices must equal $n$ for the system to be completely controllable and observable.

These properties are crucial for designing state feedback controllers and state observers in control systems. The experiment utilizes MATLAB's built-in functions ctrb() and obsv() to compute these matrices efficiently, followed by rank analysis to determine system characteristics.

### Working Principle: (Code)
```matlab
clc;
clear all;

% Define system matrices
A = [2 0 1 ; 0 0 5 ; 8 2 0];
B = [0 ; 5 ; 8];
C = [1 1 1];

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
```

The ctrb() function computes the controllability matrix by forming:

$$C_o = \begin{bmatrix} B & AB & A^2B \end{bmatrix}$$

for the given system matrices A and B. 

The obsv() function calculates the observability matrix by constructing:

$$O_b = \begin{bmatrix} C \\ CA \\ CA^2 \end{bmatrix}$$

for matrices A and C. The rank() function determines the rank of these matrices, which is compared with the system order (n) to assess controllability and observability. Conditional statements provide clear feedback on the system's control and observation capabilities.

### Result:
For the given system with:

$$A = \begin{bmatrix} 2 & 0 & 1 \\ 0 & 0 & 5 \\ 8 & 2 & 0 \end{bmatrix}$$

$$B = \begin{bmatrix} 0 \\ 5 \\ 8 \end{bmatrix}$$

$$C = \begin{bmatrix} 1 & 1 & 1 \end{bmatrix}$$

The analysis results are:
- The controllability matrix has rank 3, equal to the system order (n=3)
- The observability matrix has rank 3, equal to the system order (n=3)  
- Therefore, the system is both CONTROLLABLE and OBSERVABLE

The system demonstrates full controllability and observability, indicating that it is suitable for state feedback control design and state estimation applications.

### Discussion:
The experiment successfully demonstrated the computational approach to analyzing controllability and observability properties. The full-rank results indicate that the chosen system matrices provide complete control authority over all state variables and full observability of the internal states through the output measurements. This is ideal for control system applications requiring precise state regulation and estimation.

The commented alternative system matrices in the code show a contrasting case where the system would be observable but not controllable, highlighting how different parameter choices significantly affect system properties. Such analysis is crucial in control system design to ensure that the desired performance specifications can be achieved.

### Conclusion:
The experiment provided hands-on experience in evaluating controllability and observability of linear systems using MATLAB computational tools. The systematic approach of matrix computation, rank analysis, and conditional evaluation offers a reliable method for assessing system properties in control engineering applications. Understanding these fundamental concepts is essential for designing effective feedback controllers and state observers.

### References:
1. Ogata, K. "Modern Control Engineering" - Control System Analysis and Design
2. MATLAB Control System Toolbox Documentation - ctrb() and obsv() functions
3. Franklin, G.F., Powell, J.D., Emami-Naeini, A. "Feedback Control of Dynamic Systems"
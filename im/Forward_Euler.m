% Solving the van der Pol equation using Matlab's ode45 command

C = 0; % Parameter C in the model.
% The ODE rhs function as an "anonymous function".
f = @(t,u)  [u(2); -C*(u(1)^2 - 1).*u(2) - u(1)];

U0 = [2; -0.65];  % Initial condition
tspan = linspace(0,20,1e3); % Time span

% Set low tolerances to ensure an accurate solution
options = odeset('RelTol',1e-11,'AbsTol',1e-11); 
[~,u_ode45] = ode45(f, tspan, U0);

% Forward Euler setup (timestep, vector of solution points etc)
dt = 0.15; n = round(tspan(end)/dt); u_Euler = NaN(2,n);

u_Euler(:,1) = U0; % Initial condition for Euler method
for i = 1:n-1
    t = (i-1) * dt; % Current time (NB: Unused currently!)
    u_Euler(:,i+1) = u_Euler(:,i) + dt * f(t, u_Euler(:,i));
end
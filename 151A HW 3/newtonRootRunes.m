%                       newtonRootRunes.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^2 - 3.0
%
% Runes were added for style
% Jean-Michel Maldague

fstring = 'x^2 - 3';      % target function 
dfstring = '2*x';       % target function's derivative

x0  = 5;               % initial guess
eps = 1.0e-12;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

num_spaces = 10;
num_runes  = 20;
first_rune = '16a0'; % runic: 16a0, chess: 2654, music: 2669
rune_block = 81;     % runic:  81 , chess:  12 , music: 7
spaces = ''; for (i=1:num_spaces); spaces = [spaces,' ']; end
runes1 = ''; for (i=1:num_runes);  rune_in = ...
        ['\x',dec2hex(hex2dec(first_rune)+floor(rune_block*rand))];...
        runes1 = [runes1,sprintf(rune_in)]; end
runes2 = ''; for (i=1:num_runes);  rune_in = ...
        ['\x',dec2hex(hex2dec(first_rune)+floor(rune_block*rand))];...
        runes2 = [runes2,sprintf(rune_in)]; end
runes3 = ''; for (i=1:(15+2*(num_runes+num_spaces)));  rune_in = ...
        ['\x',dec2hex(hex2dec(first_rune)+floor(rune_block*rand))];...
        runes3 = [runes3,sprintf(rune_in)]; end
disp(sprintf(['\n',runes1,spaces,'Newton''s Method',spaces,runes2]));
disp(sprintf(['Iter   Approx. root    Root error',...
    '          Residual           Approx. alpha']));

iter = -1;      % so that the initial data is displayed from the while loop
en   = '';      % root error at the nth step
enm1 = '';      % root error at the (n-1)th step
enm2 = '';      % root error at the (n-2)th step
alpha = '';     % approximate order of convergence

xn = x0;
fn = 2*eps;     % so that while loop runs at least once
dfn= 1;

while(abs(fn) > eps)&&(iter<1000)
   if (iter>-1)
       xn  = xn - fn/dfn;      % Newton iteration
   end
   enm2 = enm1;
   enm1 = en;
   en  = abs(xn-sqrt(3));
   
   if (iter>0)
       alpha = log(en/enm1)/log(enm1/enm2);
   end
   
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   dfn = ans; 
   
   iter = iter + 1;   
   
   disp(sprintf(['%-5ld  %-15.10f %-15.10e    %-15.9e    %-15.10f'],...
       iter,xn,en,fn,alpha));
   
end


%
% Print out final results
%
disp(sprintf(['Approximate root of  ',fstring,...
    '  with initial iterate %.2f is %-15.13f.'],x0,xn));

disp(sprintf([runes3,'\n']));

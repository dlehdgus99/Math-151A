%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A routine for evaluating the interpolant based on the
%  Newton form of an interpolating polynomial.
%
%  d,x are vectors of size n+1
%
%  On entry x(i) = interpolation points
%           d(i) = divided differences (the output from Divdif)
%           t    = point where the value of the interpolant is desired
%
%
% Returns p     = value of the interpolant at t.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p] = Interp(t,xval,d,n)
  p=ones(size(t))*d(n+1);
  for (i=n-1:-1:0)
    p=d(i+1)+(t-xval(i+1))*p;
  end

%
% You have to implement this function 
% 
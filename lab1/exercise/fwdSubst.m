function y = fwdSubst(L,b,k)
    [m,n]=size(L);
    if ~exist('k')
        k = 1;
    end
    
    y = b(k)/L(k,k);
    if k < n % Recursion step
        l = [zeros(k,1);L(k+1:m,k)];
        y = [y;fwdSubst(L, b-y*l,k+1)];
    end
end
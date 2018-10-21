function h = subplottight(n,m,i)
    [c,r] = ind2sub([m n], i);
    ax = subplot('Position', [((c-1)/m), 1-(r)/n, (1/m)-(1/m)*0.3, (1/n)-(1/n)*0.3]);
    
    if(nargout > 0)
      h = ax;
    end
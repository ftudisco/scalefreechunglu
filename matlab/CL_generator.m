function A = CL_generator(w)
% INPUT:    w = expected degrees vector
% OUTPUT:   A = binary adjacency matrix of a graph G in G(w)
    n = length(w);
    m = (dot(w,w)/sum(w))^2 + sum(w); 
    m = ceil(m/2);
    wsum = [0 ; cumsum(w(:))]; 
    wsum = wsum/wsum(end);
    I = discretize(rand(m,1),wsum);
    J = discretize(rand(m,1),wsum);
    A = sparse([I;J],[J;I],1,n,n);
    A = spones(A);
end



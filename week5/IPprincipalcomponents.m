function [Y, X, e]  = IPprincipalcomponents( x, k )    
    % Do full reconstruction if no parameter is given
    if nargin < 2
        k = size(x, 1);
    end
    
    K = size(x, 2);
    
    % Calculate mean vector
    mx = sum(x, 2) / K;
    
    % Matrix of difference vectors
    % Each column of the input matrix has the mean vector substracted
    D = x - repmat(mx, [1, K]);
    
    % Covariance matrix
    Cx = D * D' / K;
    
    % Determine eigenvalues and eigenvectors
    % Eigenvalues are sorted in descending order
    % Eigenvectors are the rows of the matrix A corresponding to the
    % eigenvalue at the same index in i (i.e. e(1) corresponds to A(1, :))
    % eig() returns normalized eigenvectors, so further normalization is
    % not needed
    [eigenVectors, eigenValues] = eig(Cx, 'vector');
    [e, order] = sort(eigenValues, 'descend');
    A = eigenVectors';
    A = A(order, :);
    
    % Each row of Y is a principal component image
    Y = A * D;
    
    % Compute the (possibly partial) reconstruction
    At = A';
    X = (At(:, 1:k) * Y(1:k, :)) + repmat(mx, [1, K]);
end


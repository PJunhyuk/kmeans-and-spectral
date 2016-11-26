function [label] = spectral_clust(data, K, sigma)
% calculate label using the function of spectral clustering

%% check time required
tic

%% set global variables
global N
N = size(data, 1);

global d
d = size(data, 2);

%% form affinity matrix
matrix_A = zeros(N, N);

for i=1:N
    for j=1:N
        distance_ij = euclidean_distance(data(i,:), data(j,:));
        matrix_A(i, j) = exp(-distance_ij/(2*sigma^2));
        if(i == j)
            matrix_A(i, j) = 0;
        end
    end
end

%% define matrix D
matrix_D = zeros(N, N);

for i=1:N
    matrix_D(i, i) = sum(matrix_A(i, :));
end

%% construct the matrix L
% L = D^(-1/2) * A * D^(-1/2)
matrix_L = zeros(N, N);

for i=1:N
    for j=1:N
        matrix_L(i,j) = matrix_A(i,j) / (sqrt(matrix_D(i,i)) * sqrt(matrix_D(j,j)));  
    end
end

%% form the matrix X
[eigenvectors, eigenvalues] = eig(matrix_L);

matrix_X = zeros(N, K);
size_eigenvectors = size(eigenvectors(1,:));
size_eigen = size_eigenvectors(1,2);
matrix_X(:, :) = eigenvectors(:, size_eigen-K+1:size_eigen);

%% form the matrix Y
matrix_Y = normc(matrix_X);

%% cluster them using K-means algorithm
% use my_kmeans_no_visualize, because we don't need visualize functions in
% my_kmeans function
label = my_kmeans_no_visualize(matrix_Y, K);

%% visualize result
visualize_result(data, label);

%% check time required
disp('time required: ');
toc

end
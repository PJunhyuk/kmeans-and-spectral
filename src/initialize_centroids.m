function centroids = initialize_centroids(data, K)
% initliaze centroids by randomly pick K points

%% get global variables
global N
global d

%% initialize centroids
centroids = zeros(K, d);

%% pick K random indexes between 1 to N
random_indexes = rand(K, 1);
random_indexes = ceil(random_indexes .* N);

random_indexes = unique(random_indexes);

%% prevent duplication
while(size(random_indexes, 1) ~= K)
    random_indexes = rand(K, 1);
    random_indexes = ceil(random_indexes .* N);

    random_indexes = unique(random_indexes);
end

%% initialize centroids using random_indexes
for i=1:K
    centroids(i, :) = data(random_indexes(i, 1), :);
end

end


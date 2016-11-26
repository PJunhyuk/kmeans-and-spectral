function label = make_clusters(data, K, centroids)
% make clusters by finding nearest centroids of each point

%% get global variables
global N
global d

%% increase cluster_times when make_clusters function is implemented
global cluster_times
cluster_times = cluster_times + 1;

%% initialize label & distance_to_centroids
label = zeros(N, 1);
distance_to_centroids = zeros(K, 1);

%% find nearest centroids of each point, and save it's data in label
for i = 1:N
    % calculate distance_to_centroids, which is distance between each points and centroids
    for j = 1:K
        distance_to_centroids(j, 1) = euclidean_distance(data(i, :), centroids(j, :));
    end
    % find min_distance_to_centroids and find it's index
    min_distance_to_centroids = min(distance_to_centroids);
    index_min = find(distance_to_centroids == min_distance_to_centroids, 1, 'first');
    label(i, 1) = index_min;
end

end


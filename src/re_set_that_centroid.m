function centroids = re_set_that_centroid(data, K, centroids, empty_cluster_index)
% re-set centroid of empty_cluster_index
% new centroid of empty_cluster_index is farthest data from current cluster

%% get global variables
global N
global d

%% set current_cluster_index
if(empty_cluster_index == 1)
    current_cluster_index = 7;
else
    current_cluster_index = empty_cluster_index - 1;
end

%% calculate distance between current_cluster_index-th centroids, and all points
distance_to_points = zeros(N, 1);

for i=1:N
    distance_to_points(i, 1) = euclidean_distance(centroids(current_cluster_index, :), data(i, :));
end

%% find farthest point of current_cluster_index-th centroids, and change it to empty_cluster_index-th centroids
farthest_point_index_list = find(distance_to_points == max(distance_to_points));

if(size(farthest_point_index_list) == 1)
    farthest_point_index = farthest_point_index_list;
else
    farthest_point_index = farthest_point_index_list(1, 1);
end

centroids(empty_cluster_index, :) = data(farthest_point_index, :);

end
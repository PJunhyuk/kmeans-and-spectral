function [label] = my_kmeans(data, K)
% calculate label using k-mean algorithm

%% check time required
tic

%% set global variables
global N
N = size(data, 1);

global d
d = size(data, 2);

global cluster_times
cluster_times = 0;

%% initialize centroids - randomly picks
centroids = initialize_centroids(data, K);

%% make clusters
label = make_clusters(data, K, centroids);

%% if some clusters are empty, re-set that cluster's centroid.
while(find_empty_cluster(K, label) ~= 0)
    empty_cluster_index = find_empty_cluster(K, label);
    centroids = re_set_that_centroid(data, K, centroids, empty_cluster_index);
    label = make_clusters(data, K, centroids);
end

%% save current centroids in previous_centroids
previous_centroids = centroids;

%% update centroids using set_centroids
centroids = set_centroids(data, K, label);

%% if there are difference between centroids and previous_centroids, do all jobs again
while(check_change_of_centroids(previous_centroids, centroids, K) == 1)
    label = make_clusters(data, K, centroids);
    while(find_empty_cluster(K, label) ~= 0)
        empty_cluster_index = find_empty_cluster(K, label);
        centroids = re_set_that_centroid(data, K, centroids, empty_cluster_index);
        label = make_clusters(data, K, centroids);
    end
    previous_centroids = centroids;
    centroids = set_centroids(data, K, label);
end

%% visualize result
visualize_result(data, label);
visualize_centroids(centroids, label);

%% print cluster_times
disp('cluster times: ');
disp(cluster_times);

%% check time required
disp('time required: ');
toc

end
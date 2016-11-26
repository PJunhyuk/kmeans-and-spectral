function differential_check_value = check_change_of_centroids(previous_centroids, centroids, K)
% check change of centroids
% return 0 if previous_centroids and centroids are same

%% initialize differential_check_value
differential_check_value = 1;

%% calculate check_result. if centroids doesn't changed, it's value is 1
check_result = (previous_centroids == centroids);

%% sum all elements of check_result.
% if result is 2*K, it means previous_centroids and centroids are exactly
% same, so return 0
if(sum(sum(check_result)) == (2*K))
    differential_check_value = 0;
end

end
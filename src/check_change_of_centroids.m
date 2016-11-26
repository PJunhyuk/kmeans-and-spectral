function differential_check_value = check_change_of_centroids(previous_centroids, centroids, K)
% check change of centroids
% return 0 if previous_centroids and centroids are same

%%
threshold_centroids = 0.001;

%% initialize differential_check_value
differential_check_value = 1;

delta_centroids = abs(previous_centroids - centroids);

if(sum(sum(delta_centroids.^2)) < (threshold_centroids^2) * size(centroids,1) * size(centroids,2))
    differential_check_value = 0;
end

%%
% %% calculate check_result. if centroids doesn't changed, it's value is 1
% check_result = (previous_centroids == centroids);
% 
% %% sum all elements of check_result.
% % if result is 2*K, it means previous_centroids and centroids are exactly
% % same, so return 0
% if(sum(sum(check_result)) == (2*K))
%     differential_check_value = 0;
% end

end
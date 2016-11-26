function centroids = set_centroids(data, K, label)
% set new centroids of cluster, finding average of each clusters

%% get global variables
global N
global d

%% calculate average of each label, and save it in centroids
for i=1:K
    for q=1:d
        sum_of_data = 0;
        number_of_data = 0;
        for j=1:N
            if(label(j, 1) == i)
                sum_of_data = sum_of_data + data(j, q);
                number_of_data = number_of_data + 1;
            end
        end
        centroids(i, q) = sum_of_data / number_of_data;
    end
end

end
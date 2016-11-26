function empty_cluster_index = find_empty_cluster(K,label)
% find empty cluster, and return it's index.
% if all clusters are non-empty, return 0.

%% initialize empty_cluster_index
empty_cluster_index = 0;

%% find empty cluster, and set empty_cluster_index for it's index
for i=1:K
    if(size(find(label == i)) == 0)
        empty_cluster_index = i;
        break;
    end
end

end
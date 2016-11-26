# kmeans-and-spectral
Clustering toy datasets using K-means algorithm and Spectral Clusting algorithm

## Usage
  1. Download Matlab functions in src folder, and toy dataset in toydata folder
  1. Open toydata file
  1. Set data, and set K which is suitable for it (and sigma for spectral_clust function)
- Suggested sigma value is 1
  
#### Sample Usage
```
load('data_Aggregation.mat');
my_kmeans(D, 7);
```
```
load('data_TwoDiamonds.mat');
spectral_clust(D, 2, 1);
```

## Results
You can check time required, number of rules(by check size of rule), five most confidence rules(by check five_rule variable), and longest rule(by check longest_rule variable)

#### Sample Results
Input:
```
load('data_TwoDiamonds.mat');
my_kmeans(D, 2);
```
Output:
![Alt Text](https://github.com/PJunhyuk/kmeans-and-spectral/blob/master/img/sample_result_1.png)
```
cluster times: 
     7

time required: 
     2.221999    .
```

## Code Structure
-	my_kmeans.m : Calculate label using k-mean algorithm.
- initialize_centroids.m : Initliaze centroids by randomly pick K points.
- make_clusters.m : Make clusters by finding nearest centroids of each point.
- euclidean_distance.m : Calculate euclidean distance between p1, p2.
- find_empty_cluster.m : Find empty cluster, and return it's index. If all clusters are non-empty, return 0.
- re_set_that_centroid.m : Re-set centroid of empty_cluster_index. New centroid of empty_cluster_index is farthest data from current cluster.
- set_centroids.m : Set new centroids of cluster, finding average of each clusters.
- check_change_of_centroids.m : Check change of centroids. Return 0 if previous_centroids and centroids are same.
- visualize_result.m : Plot graph of data.
- visualize_centroids.m : Plot graph of centroids.
- spectral_clust.m : Calculate label using the function of spectral clustering.
- my_kmeans_no_visualize.m : alculate label using k-mean algorithm, with no data visualization - for spectral_clust function.

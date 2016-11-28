# kmeans-and-spectral
Clustering toy datasets using K-means algorithm and Spectral Clustering algorithm

## Usage
  1. Download Matlab functions in src folder, and toy dataset in toydata folder
  1. Open toydata file
  1. Set data, and set K which is suitable for it (and sigma for spectral_clust function)
- Suggested sigma value is 1

#### Sample Usage
###### Clustering data_Aggregation using K-means algorithm
```
load('data_Aggregation.mat');
my_kmeans(D, 7);
```
###### Clustering data_TwoDiamonds using Spectral Clustering algorithm
```
load('data_TwoDiamonds.mat');
spectral_clust(D, 2, 1);
```
###### Show correct answer of data_Spiral using given label(L)
```
load('data_Spiral.mat');
visualize_result(D, L);
```

## Results
You can check clustering results in form of 'label', and you can check visualized result by using 'visualize_result' function and 'visualize_centroids' function. It is also built in 'my_kmeans' function and 'spectral_clust' function.

And you can check cluster times, and time required on each implementation.

#### Sample Results
###### Result-set of data_Aggregation
![Alt Text](https://github.com/PJunhyuk/kmeans-and-spectral/blob/master/img/aggregation_set_1.png)
###### Result-set of data_Spiral
![Alt Text](https://github.com/PJunhyuk/kmeans-and-spectral/blob/master/img/spiral_set_1.png)
###### Result-set of data_TwoDiamonds
![Alt Text](https://github.com/PJunhyuk/kmeans-and-spectral/blob/master/img/twodiamonds_set_1.png)
All data-set is in order: K-means, Spectral Clustering, and given label.

## K-means mechanism
![Alt Text](https://github.com/PJunhyuk/kmeans-and-spectral/blob/master/img/kmeans-mechanism_1.png)
## Spectral Clustering mechanism

1. N : number of data
1. d : dimension of data
1. data = D - N by d matrix
1. matrix_A : affinity matrix, A_ij = exp(- (data_i - data_j)^2 / (2*sigma^2) ) - N by N matrix
1. matrix_D : diagonal matrix whose (i,i)-element is the sum of matrix_A's i-th row - N by N matrix
1. matrix_L : (D^(-1/2)) * A * (D^(-1/2)) - N by N matrix
1. matrix_X : union of k largest eigenvectors of matrix_L - N by K matrix
1. matrix_L : renormalizing each of X's rows to have unit length - N by K matrix
1. Set matrix_L to data, and run K-means algorithm, and save it's result on label.
1. Visualize data using that label.

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

## Reference
[On Spectral Clustering: Analysis and an algorithm](http://www.cs.cmu.edu/afs/cs/user/bhiksha/WWW/courses/mlsp.fall2015/www/assignments/assignment3/nips01_spectral.pdf)

## License
[MIT License](https://github.com/PJunhyuk/kmeans-and-spectral/blob/master/LICENSE)

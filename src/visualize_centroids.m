function visualize_centroids(centroids, label)
% plot graph of centroids

%% get global variables
global N

%% visualize centroids: it's shape is *, and different colors used as per labels
for i=1:N
    switch label(i, 1)
        case 1
            plot(centroids(1,1), centroids(1,2), 'k*');
            hold on
        case 2
            plot(centroids(2,1), centroids(2,2), 'r*');
            hold on
        case 3
            plot(centroids(3,1), centroids(3,2), 'b*');
            hold on
        case 4
            plot(centroids(4,1), centroids(4,2), 'g*');
            hold on
        case 5
            plot(centroids(5,1), centroids(5,2), 'm*');
            hold on
        case 6
            plot(centroids(6,1), centroids(6,2), 'c*');
            hold on
        case 7
            plot(centroids(7,1), centroids(7,2), 'y*');
            hold on
    end
end

end


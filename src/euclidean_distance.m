function d = euclidean_distance(p1, p2)
% calculate euclidean distance between p1, p2

%% calculate p: differential of two points
p = p2 - p1;

%% calculate d: euclidean_distance of two points
d = sqrt(sum(p .* p));

end
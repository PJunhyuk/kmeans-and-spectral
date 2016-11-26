function visualize_result(data, label)
% plot graph of data

%% get global variables
global N
N = size(data, 1);

%% visualize data: it's shape is ., and different colors used as per labels
for i=1:N
    switch label(i, 1)
        case 1
            plot(data(i,1), data(i,2), 'k.')
            hold on
        case 2
            plot(data(i,1), data(i,2), 'r.')
            hold on
        case 3
            plot(data(i,1), data(i,2), 'b.')
            hold on
        case 4
            plot(data(i,1), data(i,2), 'g.')
            hold on
        case 5
            plot(data(i,1), data(i,2), 'm.')
            hold on
        case 6
            plot(data(i,1), data(i,2), 'c.')
            hold on
        case 7
            plot(data(i,1), data(i,2), 'y.')
            hold on
    end
end

end


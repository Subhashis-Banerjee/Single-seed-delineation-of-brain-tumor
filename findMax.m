function [ maxIndex ] = findMax( variance, mx )

for i = 1 : length(variance)
    if mx == variance(i)
        maxIndex = i;
        break;
    end
end
end


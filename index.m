function [ p ] = index( points, x, y )

for i = 1 : size(points, 1)
    if points(i, 1) == x && points(i, 2) == y
        p = i;
        break;
    end

end


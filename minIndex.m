function [ mn ] = minIndex( finalPoints, points )

minx = finalPoints(1, 3);
miny = finalPoints(1, 4);
mn = finalPoints(1, 12);


for i = 2 : size(finalPoints, 1)
    
    if finalPoints(i, 12) < mn
        minx = finalPoints(i, 3);
        miny = finalPoints(i, 4);
        mn = finalPoints(i, 12);
    end

end
mn = index(points, minx, miny);

end


function [ V ] = threClass( I, thresholds )

V = zeros(size(I, 1), size(I, 2));
class = int32(zeros(length(thresholds)-1, 3));

for i = 1 : size(I, 1)
    for j = 1 : size(I, 2)
        p = 0;
        for k = 1 : length(thresholds) - 1
            
            if (I(i, j) >= thresholds(k)) && (I(i, j) < thresholds(k+1) + p)
                class(k, 1) = class(k, 1) + 1;
                class(k, 2) = class(k, 2) + int32(I(i, j));
                p = 1;
            end
        end
    end

end

for k = 1 : length(thresholds) - 1
    
    class(k, 3) = class(k, 2)/class(k, 1);
end
p = 0;
for i = 1 : size(I, 1)
    for j = 1 : size(I, 2)
        
        for k = 1 : (length(thresholds) - 1)
            
            if (I(i, j) >= thresholds(k)) && (I(i, j) < thresholds(k+1) + p)
                
                V(i, j) = class(k, 3);
                p = 1;
                break;
 
            end
        end
    end

end
            

end


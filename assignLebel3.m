function [ V ] = assignLebel3(I, T)
V = zeros(size(I, 1), size(I, 2));

for i = 1 : size(I, 1)
    for j = 1 : size(I, 2)
        
        if I(i, j) >= 0 && I(i, j) < T(2)
            V(i, j)  = 0;
        end
        
        if I(i, j) >= T(2) && I(i, j) < T(3)
            V(i, j)  = .2;
        end
        
        if I(i, j) >= T(3) && I(i, j) < T(4)
            V(i, j)  = .4;
        end
        
        if I(i, j) >= T(4) && I(i, j) < 256
            V(i, j)  = .6;
        end
        

    end
end

end


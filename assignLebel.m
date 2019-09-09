function [ V1, V2, V3 ] = assignLebel(I, T)

V1 = zeros(size(I, 1), size(I, 2));
V2 = zeros(size(I, 1), size(I, 2));
V3 = zeros(size(I, 1), size(I, 2));


for i = 1 : size(I, 1)
    for j = 1 : size(I, 2)
%         if I(i, j) >= 0 && I(i, j) < T(1)
%             V1(i, j) = 255;
%         end
        
        if I(i, j) >= T(1) && I(i, j) < T(2)
            V1(i, j) = 255;
        end
        
        if I(i, j) >= T(2) && I(i, j) < T(3)
            V2(i, j) = 255;
        end
        
        if I(i, j) >= T(3) && I(i, j) < 256
            V3(i, j) = 255;
        end
    end
end

end


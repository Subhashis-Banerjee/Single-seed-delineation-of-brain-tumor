function [ points ] = normalize( points, r, c )

   max = points(1, 2);
   for i = 1 : size(points, 1)
       if max < points(i, 2)
           max = points(i, 2);
       end
   end
   
   min = points(1, 2);
   for i = 1 : size(points, 1)
       if min > points(i, 2)
           min = points(i, 2);
       end
   end


   for i = 1 : size(points, 1)
       points(i, 2) = (points(i, 2) - min)/(max - min);
%          points(i, 2) = points(i, 2)/(r*c);
   end
   
end


function [ optimizedT ] = optimize( T, I )

optimizedT = zeros(1, length(T));
f = imhist(I);
p = f./(size(I, 1)*size(I, 2));

    for m = 2 : length(T)-1
        
        variance = zeros(1, 256);
        l1 = T(m-1);
        l2 = T(m+1);

        for t = l1 : l2

            w1 = 0; w2 = 0;
            for i = l1 : t
                w1 = w1 + p(i, 1);
            end

            for i = t+1 : l2
                w2 = w2 + p(i, 1);
            end

            mu1 = 0; mu2 = 0;

            for i = l1 : t
                mu1 = mu1 + i*(p(i)/w1);
            end

            for i = t+1 : l2
                mu2 = mu2 + i*(p(i)/w2);
            end

            mu = mu1*w1 + mu2*w2;

            variance(t) = w1*(mu1 - mu)^2 + w2*(mu2 - mu)^2;

        end

        mx = max(variance);
        maxIndex = findMax(variance,mx);

        optimizedT(m) = maxIndex-1;
        clear('variance');
    end
    optimizedT(1) = T(1);
    optimizedT(length(T)) = T(length(T));
end


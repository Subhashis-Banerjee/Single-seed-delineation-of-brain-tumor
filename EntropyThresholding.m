function [nT] = EntropyThresholding(T, I)
    h=imhist(I);
    [n,m]=size(I);
    %normalize the histogram ==>  hn(k)=h(k)/(n*m) ==> k  in [1 256]
    hn=h/(n*m);

    % entropy of gray level image
    imEntropy=double(0);
    
    for i=1:256
        imEntropy=double(imEntropy+(i*hn(i)*log(i)));
    end

    nT(1) = T(1);
    nT(length(T)) = 256;
     
    for k = 2 : length(T)-1
        
        lb = T(k-1);
        ub = T(k+1);
        
        % MCE
        for t = lb : ub
        % moyenne de Low range image
        lowValue= 0;
        lowSum= 0;
        for i = lb : t
            lowValue=lowValue+(i*hn(i));
            lowSum=lowSum+hn(i);
        end
        if lowSum>0
            lowValue=lowValue/lowSum;
        else
            lowValue=1;
        end

        % moyenne de High range image
        highValue= 0;
        highSum= 0;
        for i = t+1 : ub
            highValue=highValue+(i*hn(i));
            highSum=highSum+hn(i);
        end
        if highSum>0
            highValue=highValue/highSum;
        else
            highValue=1;
        end

        % Entropy of low range 
        lowEntropy=0;
        for i = lb : t
            lowEntropy=lowEntropy+(i*hn(i)*log(lowValue));
        end      

        % Entropy of high range 
        highEntropy=0;
        for i = t+1 : ub
            highEntropy=highEntropy+(i*hn(i)*log(highValue));
        end

        % Cross Entropy 
        highEntropy;
        lowEntropy;
        imEntropy;
        CE(t)= imEntropy - lowEntropy - highEntropy; 
        end
    
        % choose the best threshold

        D_min =CE(lb);
        entropie(lb)=D_min;
        
        threshold = 0;
        for t= lb : ub
            entropie(t)=CE(t);
            if entropie(t)<D_min
                D_min=entropie(t);
                threshold=t-1;
            end
        end
  
        nT(k) = threshold;

    end
      
    
end

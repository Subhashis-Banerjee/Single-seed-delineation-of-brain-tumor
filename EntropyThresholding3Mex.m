function [T, CE, k] = EntropyThresholding3Mex(I, h)
    
    %#codegen
    coder.inline('never');
    
    [n,m]=size(I);
    hn=h/(n*m);
    CE = ones(2763520, 4);
    % entropy of gray level image
    imEntropy=double(0);
    
    for i=1:256
        imEntropy=double(imEntropy+(i*hn(i)*log(i)));
    end
    
    k = 1;
    
    for t1 = 1 : 256
        
        for t2 = t1 + 1 : 256
            
            for t3 = t2 + 1 : 256
            

                % moyenne de Low range image
                lowValue1= 0;
                lowSum1= 0;
                for i = 1 : t1
                    lowValue1=lowValue1+(i*hn(i));
                    lowSum1=lowSum1+hn(i);
                end
                if lowSum1>0
                    lowValue1=lowValue1/lowSum1;
                else
                    lowValue1=1;
                end

                % moyenne de Low range image
                lowValue2= 0;
                lowSum2= 0;
                for i = t1+1 : t2
                    lowValue2=lowValue2+(i*hn(i));
                    lowSum2=lowSum2+hn(i);
                end
                if lowSum2>0
                    lowValue2=lowValue2/lowSum2;
                else
                    lowValue2=1;
                end
                
                % moyenne de High range image
                highValue3= 0;
                highSum3= 0;
                for i = t2+1 : t3
                    highValue3=highValue3+(i*hn(i));
                    highSum3=highSum3+hn(i);
                end
                if highSum3>0
                    highValue3=highValue3/highSum3;
                else
                    highValue3=1;
                end
                
                % moyenne de High range image
                highValue4= 0;
                highSum4= 0;
                for i = t3+1 : 256
                    highValue4=highValue4+(i*hn(i));
                    highSum4=highSum4+hn(i);
                end
                if highSum4>0
                    highValue4=highValue4/highSum4;
                else
                    highValue4=1;
                end

                % Entropy of low range 
                lowEntropy1=0;
                for i = 1 : t1
                    lowEntropy1=lowEntropy1+(i*hn(i)*log(lowValue1));
                end  

                lowEntropy2=0;
                for i = t1+1 : t2
                    lowEntropy2=lowEntropy2+(i*hn(i)*log(lowValue2));
                end  

                % Entropy of high range 
                highEntropy3=0;
                for i = t2+1 : t3
                    highEntropy3=highEntropy3+(i*hn(i)*log(highValue3));
                end
                
                highEntropy4=0;
                for i = t3+1 : 256
                    highEntropy4=highEntropy4+(i*hn(i)*log(highValue4));
                end

                % Cross Entropy 
                CE(k, 1) = t1;
                CE(k, 2) = t2;
                CE(k, 3) = t3;
                CE(k, 4) = imEntropy - lowEntropy1 - lowEntropy2 - highEntropy3 - highEntropy4; 
                k = k+1;
            end
        end
            
       
    end
 
         D_min = CE(1, 4);
         index = 1;
         for t= 2 : size(CE, 1);

             if D_min > CE(t, 4)
                 D_min = CE(t, 4);
                 index = t;
             end
         end
        T =  [CE(index, 1)-1, CE(index, 2)-1, CE(index, 3)-1];
  
   
end


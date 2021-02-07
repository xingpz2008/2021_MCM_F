%This script is used to manipulate the Matrix for AHP
n=11;
RI=1.51;
maxLamda=max(eig(WeightMatrix));
CI=(maxLamda-n)/(n-1);
CR=CI/RI;
for i=1:n
    if(CR<0.1)
        break
    end
    for j=(i+1):n
        if(CR<0.1)
            break;
        end
        if (WeightMatrix(i,j)>2)
            tempij=WeightMatrix(i,j);
            tempCR=CR;
            WeightMatrix(i,j)=WeightMatrix(i,j)-1;
            WeightMatrix(j,i)=1/WeightMatrix(i,j);
            %%%%%%%%%
            maxLamda=max(eig(WeightMatrix));
            CI=(maxLamda-n)/(n-1);
            CR=CI/RI;
            if(CR>tempCR)
                WeightMatrix(i,j)=tempij;
                WeightMatrix(j,i)=1/WeightMatrix(i,j);
                CR=tempCR;
            else
                fprintf("CR=%f\n",CR);
            end
        else
            if (WeightMatrix(i,j<0.5))
                tempji=WeightMatrix(j,i);
                tempCR=CR;
                WeightMatrix(j,i)=WeightMatrix(j,i)-1;
                WeightMatrix(i,j)=1/WeightMatrix(j,i);
                %%%%%%%%%
                maxLamda=max(eig(WeightMatrix));
                CI=(maxLamda-n)/(n-1);
                CR=CI/RI;
                if(CR>tempCR)
                    WeightMatrix(j,i)=tempji;
                    WeightMatrix(i,j)=1/WeightMatrix(j,i);
                    CR=tempCR;
                else
                    fprintf("CR=%f\n",CR);
                end
            end
        end
    end
end

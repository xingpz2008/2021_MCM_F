%This script is used for data process and weight calculation

WeightMatrix=xlsread("WeightMatrix.xlsx");
WeightMatrix=WeightMatrix.';
isError=0;
n=11;
for i=1:n
    for j=1:n
        if (abs(WeightMatrix(i,j)*WeightMatrix(j,i)-1)>0.001)
            fprintf("Inconsistency found at %d %d\n",i,j);
            isError=1;
        end
    end
end
RI=1.51;
maxLamda=max(eig(WeightMatrix));

[x,lamda]=eig(WeightMatrix);
r=abs(sum(lamda));
n_=find(r==max(r));
maxVector=x(:,n_);
max_lamda=lamda(n_,n_);

if (max_lamda~=maxLamda)
    fprintf("Method Error\n");
    isError=1;
end

CI=(maxLamda-n)/(n-1);
CR=CI/RI;

if CR>0.1
    for i=1:n
        for j=1:n
            for k=1:n
                if (WeightMatrix(i,j)>1)
                    if(WeightMatrix(j,k)>1&&WeightMatrix(i,k)<=1)
                        isError=1;
                        fprintf("Illogical Found at: %d %d %d\n",i,j,k);
                        tempCR=CR;
                        tempik=WeightMatrix(i,k);
                        WeightMatrix(i,k)=WeightMatrix(k,i);
                        WeightMatrix(k,i)=tempik;
                        %another calculation for CR
                        maxLamda=max(eig(WeightMatrix));
                        CI=(maxLamda-n)/(n-1);
                        CR=CI/RI;
                        %%%%%
                        if (CR<tempCR)
                            fprintf("Error Fixed, CR=%f\n",CR);
                            isError=0;
                        else
                            fprintf("Cannot resolve error at %d %d %d,Operation rolling back\n",i,j,k);
                            %roll back 
                            CR=tempCR;
                            WeightMatrix(k,i)=WeightMatrix(i,k);
                            WeightMatrix(i,k)=tempik;
                        end
                    end
                end
            end
        end
    end
end
if (isError==0&&CR<0.1)
    fprintf("Matrix Evaluation Passed\n");
    for i=1:n
        maxVector(i)=abs(maxVector(i));
    end
    maxVector=maxVector./sum(maxVector);
else
    fprintf("CR=%f isError=%d\n",CR,isError);
end
fprintf("Matrix Calculation Finalized\n");
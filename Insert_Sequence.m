%%
%直接插入排序算法
function y=Insert_Sequence(A,x)
for i=1:length(A)
    if A(i)<x
        flag=i;
        continue;
    else
        for j=length(A)+1:-1:flag+1
            A(j)=A(j-1);
        end
        A(flag+1)=x;
    end
end
y=A;
end
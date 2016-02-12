%%
%利用分治策略和递归算法查找x在规模为n的数组的位置
function y=Binary_Search(L,a,b,x)%a是寻找范围起始位置的下标，b是寻找范围终止位置的下标
if a<1||b>length(L)
    disp('   检索范围不满足,请重新输入:');
elseif a>b
       y=-1;
else
   m=ceil((a+b)/2);
   if x==L(m) 
      y=m;
   elseif x>L(m)
       
       y=Binary_Search(L,m+1,b,x);
   else
       y=Binary_Search(L,a,m-1,x);
   end; 
end;

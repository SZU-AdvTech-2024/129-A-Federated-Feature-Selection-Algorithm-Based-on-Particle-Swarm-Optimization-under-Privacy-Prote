function xpop=jiema(pop,k)
ss=size(pop,1);
for(i=1:ss)
    for(j=1:k)
        if(pop(i,j)>rand)
            xpop(i,j)=1;
        else
            xpop(i,j)=0;
        end
    end
end
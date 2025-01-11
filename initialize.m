function pop = initialize(popsize, bounds,k)

bt=rand;
for(i=1:popsize)
    for(j=1:k)
        bt=4*bt*(1-bt);
        if bt==0.25 | bt==0.5 | bt==0.75 | bt==0
            bt=bt+0.1*rand;
        elseif bt==1
            bt=bt-0.1*rand;
        end
        pop(i,j)=bt;
    end
end

function out = slCost(num,pos,fc,sl)
    c = physconst('LightSpeed');
    arr = phased.ConformalArray('ElementPosition',[zeros(1,num);pos;zeros(1,num)]);
    % save full 10g plot
    p = pattern(arr,fc,[-90:.1:90],0,'PropagationSpeed',c, ...
         'CoordinateSystem','rectangular','Type','powerdb');
    p = sort(findpeaks(p),'descend');
    out = p(2,1) - sl;
end
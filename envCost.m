function out = envCost(num,pos,fc,sl)
    c = physconst('LightSpeed');
    arr = phased.ConformalArray('ElementPosition',[zeros(1,num);pos;zeros(1,num)]);
    p = pattern(arr,fc,[-90:.1:90],0,'PropagationSpeed',c, ...
         'CoordinateSystem','rectangular','Type','powerdb');
    out = sumsqr(p - sl);
end
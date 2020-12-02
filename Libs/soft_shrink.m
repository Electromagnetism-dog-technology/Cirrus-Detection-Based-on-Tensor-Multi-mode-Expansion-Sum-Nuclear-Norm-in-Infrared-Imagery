function [dx] = soft_shrink(dx,Thresh)
s = abs( dx );
dx = max(s - Thresh,0).*sign(dx);

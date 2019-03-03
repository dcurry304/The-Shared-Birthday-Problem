function dist = getpathdistance(x, y, path)
%this function calculates the distance between points that depend on a path
%taken. The inpput is the vectors of points, a and y, and the path choice
%vector.  The output is a vector of the same length with the distances in
%each position

N = length(path);
dist = 0;
for k = 1:N
    if k ~= N 
        distance = sqrt((x(path(k))-x(path(k+1)))^2 + (y(path(k))-y(path(k+1)))^2);
        dist = dist + distance;
    else
        distance = sqrt((x(path(N)) - x(path(1)))^2 + (y(path(N)) - y(path(1)))^2);
        dist = dist + distance;
    end
end
end

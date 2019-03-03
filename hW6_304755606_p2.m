%Problem 2 Simulated Annealing
%David Curry
%ID: 304755606
clear all;
clc;
rng('default');
%define where points are and the random path
N = input('Please input value for N: ');
x = zeros(1,N);
y = zeros(1,N);
path = randperm(N);
%fill x and y  with random values
for k = 1:N
    x(k) = rand;
    y(k) = rand;
end
%find initial distance
dist = getpathdistance(x, y, path);
%define intial conditions
T = 1000;
index = 0;
D_vec = zeros(1,1379);
%loop until temp > 1
while T > 1
    %radndomly swap two values and create a new path
    swap = randperm(N,2);
    pathNew = path;
    pathNew(swap(1)) = path(swap(2));
    pathNew(swap(2)) = path(swap(1));
    %find new distance based on new path
    distNew = getpathdistance(x,y,pathNew);
    %calculate p
    diff = distNew - dist;
    p = exp(-1000*diff/T);
    z = rand;
    %update path based on the probabiltiy p
    if diff < 0 
        path = pathNew;
        dist = distNew;
    elseif p > z
        path = pathNew;
        dist = distNew;
    end
    %update T and index
    T = T*(1 - 0.005);
    index = index + 1;
    %put distance values in new array
    D_vec(index) = dist;
end
%create iterations vector
iterations = linspace(1,index,index);
%creae new x, y arrays to graph in correct order
x2 = zeros(1,N);
y2 = zeros(1,N);
for k = 1:N
    x2(k) = x(path(k));
    y2(k) = y(path(k));
end
%plot graphs
plot(x2,y2,'o-');
xlabel('x');
ylabel('y');
figure;
plot(iterations, D_vec,'r');
xlabel('iterations');
ylabel('distance');
    
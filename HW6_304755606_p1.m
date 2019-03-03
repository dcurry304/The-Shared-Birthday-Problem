%Problem 1 The Shared Birthday Problem
%David Curry
%ID: 304755606
clear all;
clc;
rng('default');
%define how many iterations, and the vectors
top = 10^4;
N_vec = zeros(1,top);
group = zeros(1,52);
%loop thru all iterations
for m = 1:top
    %define initial condtions and first random number
    index = 1;
    match = 0;
    group(index) = randi([1,365]);
    %loop while there isnt a match
    while match == 0
       index = index + 1;
       group(index) = randi([1,365]);
       %loop thru all value less than the index value
       for j = 1:index-1
           %check if any are within a week of each other
           if abs(group(index) - group(j)) < 7 || abs(group(index) - group(j)) > 358 
               N_vec(m) = index;
               match = 1;
           end
       end
   end
end
%calculate median and print and plot histogram
x = median(N_vec);
fprintf('Median Number of People = %1.0f',x);
histogram(N_vec);
xlabel('Amount of People');
ylabel('Number of times occured');

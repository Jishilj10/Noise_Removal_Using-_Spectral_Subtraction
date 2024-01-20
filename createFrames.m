
function [vectorFrames,numberSlices] = createFrames(x,hop,windowSize)

numberSlices = floor((length(x)-windowSize)/hop);%Find the max number of slices that can be obtained
x = x(1:(numberSlices*hop+windowSize));%
vectorFrames = zeros(floor(length(x)/hop),windowSize);% Create a matrix with time slices
for index = 1:numberSlices% Fill the matrix
    indexTimeStart = (index-1)*hop + 1;
    indexTimeEnd = (index-1)*hop + windowSize; 
    vectorFrames(index,:) = x(indexTimeStart: indexTimeEnd);
end
return

function vectorTime = fusionFrames(framesMatrix, hop)

sizeMatrix = size(framesMatrix);

numberFrames = sizeMatrix(1);% Get the number of frames

sizeFrames = sizeMatrix(2);% Get the size of each frame

vectorTime = zeros(numberFrames*hop-hop+sizeFrames,1);% Define an empty vector to receive result

timeIndex = 1;


for index=1:numberFrames% Loop for each frame and overlap-add
    vectorTime(timeIndex:timeIndex+sizeFrames-1) = vectorTime(timeIndex:timeIndex+sizeFrames-1) + framesMatrix(index,:)';
    timeIndex = timeIndex + hop;    
end

return
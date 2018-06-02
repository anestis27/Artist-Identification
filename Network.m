% Load the images for the Train.
pathToTrainImages = fullfile('C:\Users\Orion\Documents\MATLAB\Examples\train');
trainImages = imageDatastore(pathToTrainImages,...
    'IncludeSubfolders',true,'LabelSource','foldernames');
% Load the images for the Test.
pathToTestImages = fullfile('C:\Users\Orion\Documents\MATLAB\Examples\test');
testImages = imageDatastore(pathToTestImages,...
     'IncludeSubfolders',true,'LabelSource','foldernames');
 
network = alexnet;
network.Layers;
layersTransfer = network.Layers(1:end-3);
numClasses = numel(categories(trainImages.Labels));
layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor', 25,'BiasLearnRateFactor',25)
    softmaxLayer
    classificationLayer];
options = trainingOptions('sgdm',...
    'MiniBatchSize', 20,...
    'MaxEpochs',4,... %An epoch is a full training cycle on the entire training data set.
    'InitialLearnRate',1e-4,... %Increased the learning rate factors for the fully connected layer to speed up learning in the new final layers.
    'Verbose',false);

%Start the classification.
trainedNetwork = trainNetwork(trainImages,layers,options);
predictedLabels = classify(trainedNetwork,testImages);
predictions = predict(trainedNetwork, testImages);
%Save the results to a file 'csvlist.dat'.
csvwrite('csvlist.dat',predictions)
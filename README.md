# Artist-Identification
Artist identification on a pre-trained Convolutional Neural Network for image classification called AlexNet. 
The network was chosen because it performs with higher accuracy than other known image classification networks, and because it is readily available within MatLab to use and modify. A transfer learning method was used, where the last three layers of AlexNet which classifies images based on 1000 different object classes was removed and replaced by three new layers which classifies based on the four artists.

# Preprocessing  
Before the images were fed to AlexNet, they were cropped at the center to the dimensions required by the network, 227x227x3. This corresponds to an image with the height and width of 227 pixels , with the three color channels red, green and blue. The images were also labeled with their corresponding artist. 

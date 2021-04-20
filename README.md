# Dithering
Floyd-Steinberg and Ordered dithering
Floyd-Steinberg dithering. The main logic behind this algorithm is the compensation of the error of the neighboring pixels, when intensity of the previous has changed. We try to simulate the higher order grayscale images, with only two, i.e. using only black and white. So, we distribute the error at the different amounts to 4 neighbor pixels.\\
Ordered dithering. We create a dithering matrix of size 2*2. Where inputs to this matrix are 64, 128 and 192, 0. And then we compare each pixel of the input image with the dithering matrix. If the pixel value is greater than the corresponding value of the dithering matrix we make it white, if not we leave it as black. Then, we obtain grayscale looking image consisting of black and white dots.

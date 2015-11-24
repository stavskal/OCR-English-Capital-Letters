#Object Character Recognition with SVMs

OCR script for English handwritten capital letters. Models are pre-trained and stored in 'models93.mat'

#Installation
* First make sure you have a supported C/C++ compiler.
* Download LIBSVM package from their website
* Then execute on Matlab:
* mex -setup
* cd('<download_path>/libsvm/matlab')
* make
* After you have installed LIBSVM you need to add its path to the Matlab environment. Because matlab has functions with the same name you need to 'shadow' them.
* run:  addpath 'install_path_of_LIBSVM'


###Dependencies
You need to install LIBSVM and link it appropriately to your Matlab installation. Otherwise there will be errors raised during script execution (see comments inside)

##Author
* skalidis@ceid.upatras.gr

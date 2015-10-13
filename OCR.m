
clc 
clear
%{ 

The following script was written as part of a university project, although
many additions were made to be a fully working Object Character Recognition
Engine for english capital letters. It requires LIBSVM to be installed and
linked to matlab installation, in order to run properly.

Also due to the simplistic nature of this project, the image needs to 
contain only the letters and it is highly advised that it is binary in its
initial form

Example image is contained on github.com/stavskal
%}


%The pretrained model is saved under the same directory in models93.mat
load('models93.mat')

%Image containing to-be-recognized letters 
image=imread('TestImage.jpg')

%First Step of Preprocessing
%Convert RGB -> Binary
image=im2double(rgb2gray(image));
imageComp=im2bw(image,graythresh(image));


rec=1;

%Connected Components algorithm requires inverse binary image
%to label all components correctly
temp=ones([size(image,1) size(image,2)]);
imageComp=temp-imageComp;

% cc is a matrix, same in size as initial image
cc=bwconncomp(imageComp,4);

%Label matrix contains all connected components in the form:
%first component is represented by ones(1), second by 2, etc.
Label=labelmatrix(cc);

k=1;
for i=1:cc.NumObjects
    
    for j=1:2
        %Preprocessing of each letter
        %'letter' matrix after the following procedure will contain
        %only one labeled component. It is then resized to 25x25
        
        
        %cut off leftmost and righmost part of letter
        if j==1
            ele=find(Label==i);
            [x ,y]=size(Label);
            first1=floor(ele(1)/x)+1;
            last1=ceil(ele(end)/x);
        %insert in "letter" matrix letter perigramma
        elseif j==2
            ele=find(letter==i);
            if numel(ele)~=0
            [x, y]=size(letter);
            first=floor(ele(1)/x)+1;
            last=ceil(ele(end)/x);
            end
        end
        

            if j==1
            letter=Label(:,(first1:last1));
            
            elseif j==2
             letter=letter(:,(first:last));
            
             
             end

            if j==1
                letter=imrotate(letter,90);
            end
        
        
    end
    %rotating back to its initial form
    letter=(imrotate(letter,-90));

    separatedLetter=image( (first:last), (first1:last1));

    test_image=double(imresize(separatedLetter, [25 25]));
        
    X(k,:)=double(test_image(:));
    k=k+1;
   
    
    
end

 y=ones(size(,1),1);

 %predicting each letter using pretraind 'model'
 %y==13 does not contribute in any way to the result, just required
[recc,a,qwd] = ovrpredict(double(y == 13), X, model);

%converting class number to letter (ASCII), 1->A,2->B, etc
Handwritten_Text=char(recc+64)'

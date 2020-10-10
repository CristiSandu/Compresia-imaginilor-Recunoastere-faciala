function [m A eigenfaces pr_img] = eigenface_core(database_path)
  
 T = [];
 j = 0;
 
 for i = 1:10
    %citim imaginile din directorul database_path 
    %si formam calea catre fiecare imagine 
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    
    %salvam fiecare imagine intr-o matrice si transformam 
    %matricea intrun vector coloana 
    IMG = double(rgb2gray(imread(image_path)));
    colom = IMG(:);
    
    %salvam vectorii in matricea T
    j = j+1;
     for l = 1:length(colom)
       T(l,j) = colom(l);
     endfor
  
 endfor
 
 %facem media pe fiecare lini si salvam in vectorul m   
 m = mean(T');
 
  %calculam matricea A ca fiind diferenta dintre T si m'
  %m este salvat ca vector linie  
  A = T-m';
  
  %formam matricea B
  B = (A')*A;
  
  %apelam functia eig si
  %construim matricea V care contine vectorii proprii mai mari ca 1
  [X D] = eig(B);
  V = [];
  D_dia = diag(D);
  for i = 1:length(D_dia)
    if(D_dia(i)>1)
      V = [V X(:,i)];
    endif
  endfor
  
  %calculam matricea cu fetele proptii ca produs dintre A*V
  eigenfaces = A*V;
  
  %calculam proiectia 
  pr_img = eigenfaces'*A;
  
end
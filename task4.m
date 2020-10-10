function [A_k S] = task4(image, k)
  A_k = [1 1 1 ;1 1 1 ;1 1 1];
  S = [2 1 2;2 4 2; 1 2 3];
  s = 0;
  
  A = double(imread(image));
  [m n] = size(A); 
  
  %calcularea mediei pt fiecare vector a_i
  %si salvarea intrun vector u
  for i = 1:m
    s = 0;
    for j = 1:n
      s = s+A(i,j);
    endfor
    u(i) = s/n;
   
  endfor
  %transpunem vectorul u pentru a fi un vector coloana
  u = u';
  
    %actualizam valorile lui a_i dupa formula a_i=a_i-u_i 
    A(1:m,:) = A(1:m,:)-u(1:m);
  
  %construim matricea Z de covarianta 
  Z = A*(A'/(n-1));
  
  %aplicam functia eig asupra matricei Z
  [V S] = eig(Z);
  
    %formam spatiul k-dimensional al componentelor principale 
    W(:,1:k) = V(:,1:k);
  
  %calculam proiectia lui A pe spatiul componentelor principale
  Y = W'*A;
  
  %aproximam matricea initiala
  A_k = W*Y+u;  
  
endfunction
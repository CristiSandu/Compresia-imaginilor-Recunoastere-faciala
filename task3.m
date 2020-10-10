function [A_k S] = task3(image, k)
  A_k = [1 1 1 ;1 1 1 ;1 1 1];
  S = [1 1 1 ;1 1 1 ;1 1 1];
  s = 0;
  
  A = double(imread(image));
  [m n]=size(A);
 
 %calcularea mediei pt fiecare vector a_i
 %si salvarea intrun vector u
  for i = 1:m
    for j = 1:n
      s = s+A(i,j);
    endfor
    u(i) = s/n;
    s = 0;
    
  endfor
  %transpunem vectorul u pentru a fi un vector coloana 
  u = u';

  %actualizam valorile lui a_i dupa formula a_i=a_i-u_i
    A(1:m,:) = A(1:m,:) - u(1:m);
  
  %constuim matricea Z dupa formula
  Z = A'/sqrt(n-1);
  
  %facem svd pentru matricea Z
  [U S V] = svd(Z);
  [m n] = size(Z);
  U(:,k+1:end) = [];
  V_t = V';
  V_t(k+1:end,:) = [];
  
  %formam spatiul k-dimensional al componentelor principale 
    W(:,1 : k)=V(:,1 : k);
 
  %calculam proiectia lui A pe spatiul componentelor principale 
  Y=W'*A;
  
  %aproximam matricea initiala 
  A_k=W*Y+u;
  
endfunction
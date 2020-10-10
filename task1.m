function A_k = task1(image, k)
  
  %transformam imaginea in matrice 
  A = double(imread(image));         
  [m n] = size(A);
  
  %apelam functia svd
  [U S V] = svd(A);       
  
  %eliminam ce apare dupa linia/coloana k
  U(:,k+1:end) = [];
  S(:,k+1:end) = [];
  S(k+1:end,:) = [];
  V_t = V';
  V_t(k+1:end,:) = [];
  
  %formam A_k
  A_k = U*S*V_t;
  
endfunction
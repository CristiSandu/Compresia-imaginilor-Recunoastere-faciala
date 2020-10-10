function task2(image)
%la inceput am  dat adresa imagini ca parametru de intrare  
A = double(imread(image));
[m n] = size(A);
  %formare grafic 1 apeland svd 
  [U S V] = svd(A);
  
  %salvand diagonala matricei S care reprezinta valorile singulare ale lui A 
  x = diag(S);
  
  %si formam graficul dand plot la vector
  figure(21);
  plot(x);  

k = [1:19 20:20:99 100:30:min(m,n)];    %definire k
dim = length(k);            
suma4 = zeros(dim);

  %parcurgem vectorul k 
  for i = 1:dim               
      
      %si apelam task-ul 1 pentru fiecare k(i)  
      %toate celelalte grafice se fac in acest for   
      A_k = task1(image,k(i));
      
      %formare grafic 2  
      suma = 0;
      
      %formam prima suma din formula 
      for j = 1:k(i)
        suma = suma+S(j,j);
      endfor
      
      %formam a doua suma din formula 
      suma1 = 0;
      for l = 1:min(m,n)
        suma1 = suma1+S(l,l);
      endfor
      
      %facem raportul care il salvam de fiecare data intr-un vector suma2
      suma2(i) = suma/suma1;
      
      %formare grafic 3
      s = 0;
      
      %facem cele 2 sume 
      for j = 1:m
        sum3 = 0;
        for l = 1:n
          sum3 = sum3+(A(j,l)-A_k(j,l))*(A(j,l)-A_k(j,l));
        endfor
        s = s+sum3;
      endfor
      
      %facem raportul sumelor cu m*n
      suma4(i) = (s)/(m*n);
      
      %formare grafic 4
      
      %implementam formula de la graficu 4 salvand pentru fiecare k(i) in 
      %vectorul suma5 
      suma5(i) = (m*k(i)+n*k(i)+k(i))/(m*n);
      
  endfor
 
  %facem graficul 2
  figure(22);
  plot(k,suma2);
  
  %facem graficul 3
  figure(23);
  plot(k,suma4);
  
  %facem graficul 4
  figure(24);
  plot(k,suma5);
  
  %!fiecare grafic este facut in propria fereastra utilizand functia figure 
  %prima cifra reprezinta numarul cerintei iar a doua nr graficului din cerinta  

endfunction
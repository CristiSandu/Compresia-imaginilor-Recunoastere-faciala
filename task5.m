function task5(image)
 %la inceput am  dat adresa imagini ca parametru de intrare 
  A=double(imread(image));
  [m n]=size(A);
  
  k=[1:19 20:20:99 100:30:min(m,n)];
  dim=length(k);
  
  %parcurgem vectorul k 
  for i=1 : dim
    
    %si apelam task-ul 1 pentru fiecare k(i)  
    %toate graficele se fac in acest for 
    [A_k S] = task3(image, k(i));
    
    %formez graficul 1 punct cu punct dand plot pt fiecare k(i);
    figure(15);
    plot(diag(S));
    hold on;
    
    %formare graf 2
    suma=0;
    
      %facem prima suma 
      for j=1:k(i)
        suma=suma+S(j,j);
      endfor
      
      suma1=0;
      
      %facem a doua suma 
      for l=1:min(m,n)
        suma1=suma1+S(l,l);
      endfor
      
      %facem raportul celor 2 sume pe care il salvam in vectorul suma2 
      suma2(i)=suma/suma1;
      
     %formare graf 3
     s=0;
     %facem cele 2 sume 
      for j=1:m
        sum3=0;
        for l=1:n
          sum3=sum3+(A(j,l)-A_k(j,l))*(A(j,l)-A_k(j,l));
        endfor
        s=s+sum3;
      endfor
      
      %facem raportul cu m*n si il salvam de fiecare data intrun vector suma4
      suma4(i)=(s)/(m*n);
      
     %formare graf 4
     
      %implementam formula de la graficu 4 salvand pentru fiecare k(i) in 
      %vectorul suma5 
      suma5(i)=(2*k(i)+1)/n;
      
  endfor
  
 %facem graficul 2
   figure(25);
 plot(k,suma2); 
    
  %facem graficul 3
   figure(35);
  plot(k,suma4); 
  
  %facem graficul 4
  figure(45);
  plot(k,suma5);
  
  %!fiecare grafic este facut in propria fereastra utilizand functia figure 
  %prima cifra reprezinta numarul cerintei iar a doua nr graficului din cerinta
  
end
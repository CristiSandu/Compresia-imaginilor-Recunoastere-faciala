 for i=1:length(k)
    
      [A_k S]=task3(image,k(i));
      S
      suma=0;
      for j=1:k(i)
        suma=suma+S;
      endfor
      
      suma1=0;
      for l=1:min(m,n)
        suma1=suma1+S;
      endfor
      
      suma2(i)=suma/suma1;
   endfor
   suma2
   
   
   if(norm(pr_img(:,i)-pr_test_image(i),2)<min_dist)
      min_dist=norm(pr_img(:,i)-pr_test_image(i),2);
      output_img_index=i;
    endif
    
    
    s=0;
  for i=1 : length(colom_test)
    s=s+colom_test(i);
  endfor
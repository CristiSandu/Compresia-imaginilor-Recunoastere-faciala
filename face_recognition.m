function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %citim imaginea fetei si o transformam in vector coloana si scadem m'
  IMG_test = double(rgb2gray(imread(image_path)));
  colom_test = IMG_test(:);
 
  A = colom_test-m';
  
  %calculam proiectia imagini de test in spatiul fetelor 
  pr_test_image = (eigenfaces')*A;
  
  %determinam cea mai mic distanta intre pr_test_image si pr_img 
  vect = [];
  for i = 1:length(pr_img)
    %calculam distanta intre vectori cu norma diferentei vectorilor 
    element = norm(pr_img(:,i) - pr_test_image(:,1));
    
    vect(i) = sum(element);
  endfor
  
  %folosim functia min ca sa scoatem distanta minima si indexul imagini 
  [min_dist output_img_index] = min(vect);
  
end
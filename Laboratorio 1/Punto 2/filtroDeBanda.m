function res = filtroDeBanda(a,n,wc1,wc2)
  
  #Se asegura que el numero de puntos siempre sea par (genera mejores resultados)
  n = n + mod (n, 2); 
  
  #Calculando Datos Relevantes
  corte_w = pi/a;                   #Primer corte del eje de frecuencias
  fs = n/2*corte_w;                 #Intervalo de muestreo en dominio de frecuencias
  f0 = fs/(n);                      #frecuencia de muestro en dominio de frecuencias
  T0 = 4*a;                         #Intervalo de muestreo en dominio del tiempo
  Ts = T0/(n);                      #frecuencia de muestro en dominio del tiempo
  
  #Calculo del dominio del tiempo
  t = [0:(n)]/(n);
  t = t * T0;
  t = t - (T0/2);
  
  #Calculo del dominio de frecuencias
  w = [0:n]/(n);
  w = w * fs;
  w = w - (fs/2);
  
  
  #Se define la transformada de Fourier a la cual se le aplicará el filtro
  sa = inline('(sin(x)+(x==0))./(x+(x==0))','x');
  X = 2*a*sa(a*w);
  

  
  
  
  
  
  
  
  
  #Se aplica el filtro pasa banda
  H = ((wc1 <= abs(w)) & (abs(w) <= wc2));
  Y = X.*H;
  
  #Se regresa al domino del tiempo usando la tranformada de fourier
  y = ifft(Y);
  y = [y(2:n+1) y(1)];
  
  #Se grafica el espectro de la señal obtenido aplicando el filtro pasa banda
  subplot(2,2,1); 
  plot(w,Y,'r');
  title('Espectro Filtro Pasa Banda'); 
  xlabel('\omega'); ylabel('Y(\omega)');
  grid;
  
  
  #Se grafica la señal con respecto al tiempo obtenida aplicando el filtro pasa banda
  #y utilizando la funcion Inversa de la Transformada de Fourier (ifft)
  subplot(2,2,2);
  plot(t,ifftshift(abs(y/Ts)));
  title('Señal en función del tiempo Filtro Pasa Banda'); 
  xlabel('t'); ylabel('x(t)');
  grid;
  
  
  
  
  
  
  
  
  #Se aplica el filtro suprime banda
  H = ((abs(w) < wc1) | (abs(w) > wc2));
  Y = X.*H;
  
  #Se regresa al domino del tiempo usando la tranformada de fourier
  y = ifft(Y);
  y = [y(2:n+1) y(1)];
  
  #Se grafica el espectro de la señal obtenido aplicando el filtro suprime banda
  subplot(2,2,3); 
  plot(w,Y,'r');
  title('Espectro Filtro Suprime Banda'); 
  xlabel('\omega'); ylabel('Y(\omega)');
  grid;
  
  #Se grafica la señal con respecto al tiempo obtenida aplicando el filtro suprime banda
  #y utilizando la funcion Inversa de la Transformada de Fourier (ifft)
  subplot(2,2,4);
  plot(t,ifftshift(abs(y/Ts)));
  title('Señal en función del tiempo Filtro Suprime Banda'); 
  xlabel('t'); ylabel('x(t)');
  grid;
  
  res = 0;
  

  

  

  

  

  
  
  
endfunction
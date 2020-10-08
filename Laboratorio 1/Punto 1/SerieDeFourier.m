#fun =  funcion periodica a aproximar 
#T0  =  periodo de la funcion
#N   =  Valores sobre los cuales se truncara la aproximacion  

function x = SerieDeFourier(fun,T0,N)
  
  #Se define el intervalo de muestreo de la funcion
  t = [-2*T0:0.1:2*T0];
  
  #Para iniciar se grafica la funcion original 
  #esto facilitara las futuras comparaciones 
  subplot(2,1,1);
  plot(t,fun(t), 'b');
  title ("Funcion Original");
  xlabel ("t");
  ylabel ("x(t)");
  axis([-1.5*T0 1.5*T0 -0.2 1.2]);
  
  
  #Se calcula la frecuencia angular a partir del periodo
  w0 = 2*pi/T0;
 
  
  #Se define la aproximacion de la SFT con el primer termino a0/2
  result = inline("(1/T0)*quad(fun,-T0/2,T0/2)","t");

  
  #Se realiza un ciclo en el cual en cada iteracion se añade un nuevo 
  #termino a la aproximacion, este ciclo ira de 1 hasta el valor
  #maximo de truncamiento
  for i = 1:max(N)
    #Se calculara el termino i-esimo
    n = i;
    
    #Se calcula el valor de an
    a = inline("fun(t)*cos(n*w0*t)","t");
    an = (2/T0)*quad(a,-T0/2,T0/2);
    
    #Se calcula el valor de bn
    b = inline("fun(t)*sin(n*w0*t)","t");
    bn = (2/T0)*quad(b,-T0/2,T0/2);
    
    #Se añade el nuevo termino a la aproximacion, este se contruye a partir de
    #los valores de an y bn, la frecuencia angular w0 y las funciones seno y coseno
    result = inline("result(t).+(an*cos(n*w0*t)).+(bn*sin(n*w0*t))","t");
    
    
    #Si la actual iteracion es una de las iteraciones de truncamiento
    #Solicitadas por el usuario se procede a graficar la aproximacion actual
    if (find(N==i))
      
      #Se grafica la proximacion para un valor de truncamiento k=i
      subplot(2,1,2);
      plot(t,result(t), 'r');
      title (strcat('Funcion aproximada con SFT y k=', num2str(i)));
      xlabel ("t");
      ylabel ("x(t)");
      axis([-1.5*T0 1.5*T0 -0.2 1.2]);
      printf("\n\nPresione <ENTER> para ver gráficas de la sinusoidal muestreada y de su espectro de magnitud \n\n\n"); 
      pause; 
    endif
  endfor
  
  x = result;
endfunction

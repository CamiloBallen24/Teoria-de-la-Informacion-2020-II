#Entradas:
#   ms  =   muestras de la señal del mensaje original
#   Tm  =   Periodo de la señal del mensaje original 
#   k   =   Numero de veces que se muestreara la señal
#   Mp  =   Altitud maxima de la señal (Solo para graficar)

function dem = Demodulador(ms,Tm,k, Mp)
  
  #Se calculan algunos valores para poder aplicar la funcion
  
  fm = 1/Tm;        #Calculando la frecuencia de la señal del mensaje
  
  fs = k*fm;        #Se define la frecuencia de muestreo, la cualsera k veces la frecuencia de la señal
  Ts = 1/fs;        #A partir de la frecuencia de muestreo se calcula el periodo de muestreo
  
  #Se calcula la frecuencia angular de la señal, el valor k se 
  #debe a que se muestreo un periodo y no toda la funcion (-infinito, infinito)
  wm = 2*pi*fm*k;   
  
  #Se definen algunas funciones iniciales
  dem = inline('0', 't');
  sa=inline('(sin(x)+(x==0))./(x+(x==0))','x');
  
  #Se añaden los terminos paso a paso
  for i = [0:length(ms)-1]
    dem = inline("dem(t) + (ms(i+1)*sa(wm * (t - (i*Ts))))", "t");
  endfor
  
  #Se grafica el resultado
  t = [0:Ts:Tm];
  subplot(2,2,4);
  plot(t,dem(t), 'r', "linewidth", 3);
  axis([0 Tm -Mp Mp]);
  title("Funcion Demodulada", "fontsize", 15);
  set(gca, "xgrid", "on");
  set(gca, "ygrid", "on");
  xlabel ("t");
  ylabel ("md(t)");
  
  
endfunction

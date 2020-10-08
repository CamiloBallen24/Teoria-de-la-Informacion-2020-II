# Entradas
#   m   =   Funcion original sobre la cual se realizara el PCM
#   Tm  =   Periodo de la funcion
#   k   =   Numero de veces que se muestreara la señal
#   Mp  =   Altitud maxima de la señall
#   n   =   Numero de Bits que se usara en el proceso de codificacion

# Salida
#   cadena =  Cadena de ceros y unos que representan la señal en formato digital


function cadena = PCM(m,Tm,k,Mp,n)  
  
  #Se define la funcion para ser trabajada en octave  
  m = inline(m, "t");
  
  #Para mostrar el funcionamiento de PCM primero se graficara la funcion original
  t = [0:0.01:Tm];
  subplot(2,2,1);
  plot(t,m(t), 'r',"linewidth", 3);
  title("Funcion Original", "fontsize", 15);
  set(gca, "xgrid", "on");
  set(gca, "ygrid", "on");
  xlabel ("t");
  ylabel ("m(t)");
  axis([0 Tm -Mp Mp]);
  
  
  
  
  
  #PRIMERA ETAPA: SAMPLING
  
  #Calculando la frecuencia de la señal del mensaje
  fm = 1/Tm;      
  
  #Se define la frecuencia de muestreo, la cualsera k veces la frecuencia de la señal
  fs = k*fm;      
  
  #A partir de la frecuencia de muestreo se calcula el periodo de muestreo, 
  #este ayudara a calcular el intervalo sobre el cual se muestreara la señal
  Ts = 1/fs;      
  
  #Se calcula los puntos de muestreo, con ayuda del perido de muestreo y 
  #el periodo de la señal, estos puntos tendran una distancia Ts
  t = [0:Ts:Tm];  
  
  #Se realiza el muestreo de la señal usando el intervalo y la funcion original
  ms = m(t);
  
  #Se grafican los resultados obtenidos
  subplot(2,2,2);
  stem(t, ms, "linewidth", 3);
  title("Funcion Muestreada - Discretizacion Horizontal", "fontsize", 15);
  set(gca, "xgrid", "on");
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  xlabel ("t");
  ylabel ("ms(t)");
  axis([0 Tm -Mp Mp]);
  
  
  
  
  
  
  
  
  
  
  #SEGUNDA ETAPA: UNIFORM QUANTIZING
  
  #Se calcula el numero de franjas que seran usadas para la discretizacion vertical
  L = power (2, n);
  
  #Se Calcula el valor de cada una de esas franjas
  delta = 2*Mp/L;
 
  #Se lleva a cabo el proceso de quantizacion uniforme
  #Primero se optiene el piso (en el caso positivo) o (techo en el caso negativo) de la franja donde esta el punto
  #Segundo se define si el punto es negativo o positivo
  #Tercero se corre la distancia correspondiente para quedar ubicado en la mitad de la franja
  mq = fix(ms./delta) + ( ((abs(ms)+(ms==0))./(ms+(ms==0))) *(delta/2));
  
 
  #Se grafican los resultados obtenidos
  subplot(2,2,3);
  stem(t, mq, "linewidth", 3);
  title("Funcion Muestreada - Discretizacion Vertical", "fontsize", 15);
  set(gca, "xgrid", "on");
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  xlabel ("t");
  ylabel ("mq(t)");
  axis([0 Tm -Mp Mp]);
  
  #Graficando franjas para mostrar el funcionamiento de la quantizacion
  hold on
  for i = [-Mp:delta:Mp]
    franja_i = inline("i.*delta.*(t+1)./(t+1)", "t");
    plot(t,franja_i(t), 'k');
  endfor
  hold off
  
  
  
  
  
  
  
  
  #TERCERA ETAPA: ENCODING
  #Se lleva cabo el proceso de codficiacion
  #Primero se dezplaza el punto Mp - (Delta/2) para que todos los puntos sean positivo
  #Segundo se divide en delta para obtener el nivel entero
  enc = (mq + Mp - (delta/2)) / delta;
  
  #Se realiza la conversion de Decimal a Binario
  #Se añade valor más alto posible para que todos los valores tengan los mismos bits 1 -> 001
  enc = [enc power(2, n)-1];
  
  #Se lleva a cabo la  conversion
  enc = dec2bin(enc);
  
  #Se quita el valor más alto ultilizado anteriormente
  enc = enc(1:end-1,:);
  
  
  #Ahora se unen todos los valores en la cadena que representaran la señal
  cadena = "";
  for i = [1:size(enc)(1)]
    for j = [1:size(enc)(2)]
      cadena = strcat(cadena,num2str(enc(i,j)));
    endfor
  endfor
  
  #De esta manera finaliza el proceso PCM que permite la conversion de una señal analoga a una digital
  
   
   
 
  #DEMODULACION
  #Pequena demostracion del proceso de demulacion
  Demodulador(ms, Tm, k, Mp);
  
  
  
  
endfunction
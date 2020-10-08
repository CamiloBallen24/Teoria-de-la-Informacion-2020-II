#Entradas:
#   md  = cadena que representa la señal digitalizada obtenida en el proceso PCM
#   Ts  = Se plantea que la duracion de cada pulso sera Ts
function res = SignalingFormats(md,Ts)
  
  #Valores que aparecieran por defecto en la grafica
  primeros_valores = md(1:9);
  
  #Para efectos practicos se convierte la cadena de ceros y unos a un array
  array_md = [];
  for md_i = md
    array_md = [array_md str2num(md_i)];
  endfor
  md = array_md;
  
  #Se calculan algunos valores previos
  #Intervalo para graficar la señal digitalizada
  t = [0:0.001:(length(md)*Ts)-0.001]; 
  
  
  
  #UNIPOLAR-NRZ
  #Simplemente se discretiza el valor t, esto genera un indice con el cual se accede
  #al arreglo, y se le dara este valor
  UnipolarNRZ = inline("md(fix(t/Ts)+1)","t");
  
  
  #BIPOLAR-NRZ
  #Se discretiza el valor t, esto genera un indice con el cual se accede
  #al arreglo, si el valor es 1 se deja, si es 0 se convierte a -1
  BipolarNRZ = inline("md(fix(t/Ts)+1)-(md(fix(t/Ts)+1)==0)","t");
  
  
  #UNIPOLAR-RZ
  #Se discretiza el valor t, si este es mayor a la mitad del pulso sera 0
  #en caso contrario, sera el valor que se almacene en el arreglo
  UnipolarRZ = inline("(mod(t,Ts)<Ts/2).*md(fix(t/Ts)+1)","t");
  
  
  #UNIPOLAR-RZ
  #Se discretiza el valor t, si este es mayor a la mitad del pulso sera 0
  #en caso contrario, sera 1 si el valor que se alamcena en el arreglo es 1, y -1 si es 0
  BipolarRZ = inline("(mod(t,Ts)<Ts/2).*(md(fix(t/Ts)+1)-(md(fix(t/Ts)+1)==0))","t");
  
  
  #AMI
  #Es un poco mas complicado y requiere modificar la cadena de 0 y unos
  #Se convetirar de manera intercalada (uno si y uno no) los valores 1 a -1
  Amd = md;
  aux = 1;
  
  for i = [1:length(md)]
    if md(i)==1
      Amd(i)= md(i)*aux;
      aux = aux*-1;
    else
      Amd(i)= md(i);
    endif
  endfor
  
  #Luego discretiza el valor t, si este es mayor a la mitad del pulso sera 0
  #en caso contrario, será el valor que se almacene en el arreglo
  AMI = inline("(mod(t,Ts)<Ts/2).*Amd(fix(t/Ts)+1)","t");
  
  
  
  #MANCHESTER
  #Primero se plantea el pulso el cual será 1 si t es menor que la mitad del pulso y -1 si es mayor
  #luego se discretiza el valor de t y si es 1 se mantendrá la forma del pulso, si es cero se invertirá
  Manchester = inline("(-(mod(t,Ts)>Ts/2)+(mod(t,Ts)<Ts/2)).*(-(md(fix(t/Ts)+1)==0) + (md(fix(t/Ts)+1)==1))","t");
  

  

  
  
  
  
  
  
  
  
  
  #Graficando UnipolarNRZ
  subplot(3,2,1);
  
  #Graficando lineas verticales para distinguir los pulsos
  hold on
  for i = [0:Ts:20*Ts]
    plot([-0.0001 0 0.0001]+i, [-100 0 100], 'k', "linewidth", 0.5)  
  endfor
  
  #Graficando el pulso
  u = plot(t,UnipolarNRZ(t), 'r', "linewidth", 2);
  title("Funcion Digital - Formato UnipolarNRZ", "fontsize", 15);
  xlabel ("t", "fontsize", 15);
  ylabel ("md(t)", "fontsize", 15);
  axis([0 Ts*9 -2 2]);
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  h = legend (u, primeros_valores);
  set (h, "fontsize", 18);
  set (h, "location", "northeast");
  set (h, "textcolor", [1 0 0]);
  hold off
  
  
  
  
  
  
  
  
  #Graficando BipolarNRZ
  subplot(3,2,2);
  
  #Graficando lineas verticales para distinguir los pulsos
  hold on
  for i = [0:Ts:20*Ts]
    plot([-0.0001 0 0.0001]+i, [-100 0 100], 'k', "linewidth", 0.5)  
  endfor
  
  #Graficando el pulso
  u = plot(t,BipolarNRZ(t), 'r', "linewidth", 2);
  title("Funcion Digital - Formato BipolarNRZ", "fontsize", 15);
  xlabel ("t", "fontsize", 15);
  ylabel ("md(t)", "fontsize", 15);
  axis([0 Ts*9 -2 2]);
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  h = legend (u, primeros_valores);
  set (h, "fontsize", 18);
  set (h, "location", "northeast");
  set (h, "textcolor", [1 0 0]);
  hold off

  
  
  

  #Graficando UnipolarRZ
  subplot(3,2,3);
  
  #Graficando lineas verticales para distinguir los pulsos
  hold on
  for i = [0:Ts:20*Ts]
    plot([-0.0001 0 0.0001]+i, [-100 0 100], 'k', "linewidth", 0.5)  
  endfor
  
  #Graficando el pulso
  u = plot(t,UnipolarRZ(t), 'r', "linewidth", 2);
  title("Funcion Digital - Formato UnipolarRZ", "fontsize", 15);
  xlabel ("t", "fontsize", 15);
  ylabel ("md(t)", "fontsize", 15);
  axis([0 Ts*9 -2 2]);
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  h = legend (u, primeros_valores);
  set (h, "fontsize", 18);
  set (h, "location", "northeast");
  set (h, "textcolor", [1 0 0]);
  hold off
  
  
  
  
  #Graficando BipolarRZ
  subplot(3,2,4);
  
  #Graficando lineas verticales para distinguir los pulsos
  hold on
  for i = [0:Ts:20*Ts]
    plot([-0.0001 0 0.0001]+i, [-100 0 100], 'k', "linewidth", 0.5)  
  endfor
  
  #Graficando el pulso
  u = plot(t,BipolarRZ(t), 'r', "linewidth", 2);
  title("Funcion Digital - Formato BipolarRZ", "fontsize", 15);
  xlabel ("t", "fontsize", 15);
  ylabel ("md(t)", "fontsize", 15);
  axis([0 Ts*9 -2 2]);
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  h = legend (u, primeros_valores);
  set (h, "fontsize", 18);
  set (h, "location", "northeast");
  set (h, "textcolor", [1 0 0]);
  hold off
  
  
  
  #Graficando AMI
  subplot(3,2,5);
  
  #Graficando lineas verticales para distinguir los pulsos
  hold on
  for i = [0:Ts:20*Ts]
    plot([-0.0001 0 0.0001]+i, [-100 0 100], 'k', "linewidth", 0.5)  
  endfor
  
  #Graficando el pulso
  u = plot(t,AMI(t), 'r', "linewidth", 2);
  title("Funcion Digital - Formato AMI", "fontsize", 15);
  xlabel ("t", "fontsize", 15);
  ylabel ("md(t)", "fontsize", 15);
  axis([0 Ts*9 -2 2]);
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  h = legend (u, primeros_valores);
  set (h, "fontsize", 18);
  set (h, "location", "northeast");
  set (h, "textcolor", [1 0 0]);
  hold off
  
  
  
  
  #Graficando MANCHESTER
  subplot(3,2,6);
  
  #Graficando lineas verticales para distinguir los pulsos
  hold on
  for i = [0:Ts:20*Ts]
    plot([-0.0001 0 0.0001]+i, [-100 0 100], 'k', "linewidth", 0.5)  
  endfor
  
  #Graficando el pulso
  u = plot(t,Manchester(t), 'r', "linewidth", 2);
  title("Funcion Digital - Formato Manchester", "fontsize", 15);
  xlabel ("t", "fontsize", 15);
  ylabel ("md(t)", "fontsize", 15);
  axis([0 Ts*9 -2 2]);
  set(gca, "ygrid", "on");
  set(gca, "box", "on");
  h = legend (u, primeros_valores);
  set (h, "fontsize", 18);
  set (h, "location", "northeast");
  set (h, "textcolor", [1 0 0]);
  hold off
  
endfunction

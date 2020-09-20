function res = FFT_Pa(a,n)
  
  #Se asegura que el numero de puntos siempre sea par (genera mejores resultados)
  n = n + mod (n, 2); 
  
  %Definiendo Valores Importantes
  n  = n;                    %Numero de muestras
  T0  = 4*a;                 %Longitud de la señal - Intervalo de Muestreo en el dominio del tiempo
  Ts  = T0/(n+1);            %Frecuencia de muestreo en el dominio del tiempo  
  fs = n*pi/a;               %Intervalo de muestreo en el domino de la frecuencoa
  f0 = 1/T0;                 %Frecuencia de muestreo
  
  %Dominio del tiempo
  t  =  [0:n]/n;
  t  =  t * T0;
  t  =  t - (T0/2); 
  
  %Dominio de la frecuencia
  f = [0:n]/n;
  f = f * fs;
  f = f - (fs/2);
  
  
  %Funcion del pulso
  x  = abs(t)<a;    

  %Calculo de la Transformada Rápida de Fourier (FFT)  
  X  = fft(x);             
  
  
  #Se grafica el pulso rectangular en el dominio del tiempo
  subplot(3,1,1); 
  t = [-T0/2:0.001:T0/2]; %Se redifine el dominio del tiempo para generar una mejor gráfica
  plot(t,abs(t)<a,'r'); 
  title('Pulso Rectangular'); 
  xlabel('t'); ylabel('x(t)'); 
  axis([-1-T0/2 1+T0/2 -0.1 1.1]);
  grid;
  
  #Se grafica el espectro del pulso rectangular obtenido utilizando la ecuación definida en clase
  omega=[-fs/2:0.01:fs/2];                        %Se redifine el dominio de la frecuencia para generar una mejor gráfica
  sa=inline('(sin(x)+(x==0))./(x+(x==0))','x');   %Funcion Auxiliar
  subplot(3,1,2);
  plot(omega,2*a*sa(a*omega))
  title('Espectro utilizando la ecuación'); 
  xlabel('\omega'); ylabel('X(\omega)');
  grid;
  
  #Se grafica el espectro del pulso rectangular obtenido utilizando la Trasformada Rápida de Fourier (FFT)
  subplot(3,1,3);
  plot(f, fftshift(X*Ts)); 
  title('Espectro utilizando FFT'); 
  xlabel('\omega'); ylabel('X(\omega)');
  grid;
  
  res = 0;
  
endfunction

#Se lee la longitud del pulso unitario
while(true)
  try 
    a = input("Ingrese la logitud del pulso unitario: ");
    a = a/2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el numero de puntos que se desean graficar del pulso unitario
while(true)
  try 
    n = input("Ingrese el numero de puntos a graficar: ");
    n = n+2-2;
    break;
  catch
    printf("Favor ingresar un vector apropiado\n");
  end_try_catch
endwhile 

#Se llama a la función FFT_Pa con los parámetros ingresados por consola
w = FFT_Pa(a,n);

#Se pausa la ejecución del programa para poder visualizar los resultados obtenidos
printf("\n\nPresione <ENTER> para ver gráficas de la sinusoidal muestreada y de su espectro de magnitud \n\n\n"); 
pause; 
clf;

#Se lee el valor del filtro pasa bajas y pasa altas
while(true)
  try 
    wc = input("Ingrese el valor del filtro pasa bajas y pasa altas: ");
    wc = wc+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

filtroPasaBajasAltas(a,n,wc);

#Se pausa la ejecución del programa para poder visualizar los resultados obtenidos
printf("\n\nPresione <ENTER> para ver gráficas de la sinusoidal muestreada y de su espectro de magnitud \n\n\n"); 
pause; 
clf;

#Se lee el primer valor del filtro pasa banda y suprime banda
while(true)
  try 
    wc1 = input("Ingrese el primer valor del filtro pasa banda y suprime banda: ");
    wc1 = wc1+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el segundo valor del filtro pasa banda y suprime banda
while(true)
  try 
    wc2 = input("Ingrese el segundo valor del filtro pasa banda y suprime banda: ");
    wc2 = wc2+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

filtroDeBanda(a,n,wc1,wc2);


#Se lee la función
while(true)
  try 
    m = input("Ingrese la funcion de la señal m(t): ");
    m_aux = inline(m, "t");
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el periodo de la señal
while(true)
  try 
    Tm = input("Ingrese el periodo de la señal m(t) a muestrear: ");
    Tm = Tm+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

#Se leen el numero de veces que desea muestrear
while(true)
  try 
    k = input("Ingrese el numero de veces que desea muestrear: ");
    k = k+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

#Se lee la amplitud de la función m(t) ingresada
while(true)
  try 
    Mp = input("Ingrese la amplitud aproximada de la función m(t), dicha aproximacion debe ser mayor o igual a la real: ");
    Mp = Mp+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

#Se lee el numero de bits que desea utilizar para la cuantizacion
while(true)
  try 
    n = input("Ingrese el numero de bits con el cual hacer la codificacion: ");
    n = n+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

#Se hace el llamado al PCM y al demulador
enc = PCM(m, Tm, k, Mp, n);

#Pausa para apreciar las graficas
printf("\n\nPresione <ENTER> para ver gráficas correspondientes a los formatos de la señal \n\n\n"); 
pause; 
clf;

#Llamada a los formatos de señalizacion
SignalingFormats(enc, (Tm/k));
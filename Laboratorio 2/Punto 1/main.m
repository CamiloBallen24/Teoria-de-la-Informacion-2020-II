#Se lee la funci�n
while(true)
  try 
    m = input("Ingrese la funcion de la se�al m(t): ");
    m_aux = inline(m, "t");
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el periodo de la se�al
while(true)
  try 
    Tm = input("Ingrese el periodo de la se�al m(t) a muestrear: ");
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

#Se lee la amplitud de la funci�n m(t) ingresada
while(true)
  try 
    Mp = input("Ingrese la amplitud aproximada de la funci�n m(t), dicha aproximacion debe ser mayor o igual a la real: ");
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
printf("\n\nPresione <ENTER> para ver gr�ficas correspondientes a los formatos de la se�al \n\n\n"); 
pause; 
clf;

#Llamada a los formatos de se�alizacion
SignalingFormats(enc, (Tm/k));
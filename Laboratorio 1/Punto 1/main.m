
#Se lee la funci�n a la cual se le hallar� la serie de Fourier Trigonom�trica
while(true)
  try 
    fun = input("Ingrese la funcion x(t): ");
    fun = inline(fun);
    fun = inline("fun(t)","t");
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el periodo de la funcion ingresada
while(true)
  try 
    T0 = input("Ingrese el periodo de la funcion x(t): ");
    T0 = T0+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

#Se leen los distintos valores de N a los cuales se truncar� la serie de Fourier
while(true)
  try 
    N = input("Ingrese los valores de N a los cuales se truncar� la serie de Fourier Trigonom�trica: ");
    N(1) = N(1)+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

SerieDeFourier(fun,T0,N);


 


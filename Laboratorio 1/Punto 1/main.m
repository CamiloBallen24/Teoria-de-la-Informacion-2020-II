
#Se lee la función a la cual se le hallará la serie de Fourier Trigonométrica
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

#Se leen los distintos valores de N a los cuales se truncará la serie de Fourier
while(true)
  try 
    N = input("Ingrese los valores de N a los cuales se truncará la serie de Fourier Trigonométrica: ");
    N(1) = N(1)+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile

SerieDeFourier(fun,T0,N);


 


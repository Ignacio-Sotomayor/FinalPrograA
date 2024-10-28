
Program cargadores;

Uses tipos;

Procedure cargadorStock(Var output:archTProd);

Var 
  actual,centinela:   tProducts;
  b:char;
  input: text;
Begin
  Assign(input,'Stock.txt');
  Assign(output,'Stock.dat');
  Reset(input);
  Rewrite(output);
  centinela.idProd := 'ZZZ99';
  While Not EOf(input) Do
    Begin
        ReadLn(input,actual.idProd,b,actual.nombre,b,actual.cantProd);
      Write(output,actual);
    End;
  Write(output,centinela);
  Close(output);
  Close(input);
End;
Procedure cargadorVentas(Var output: archTProd);

Var 
  carga,actual,centinela:   tProducts;
  b:char;
  input: text;
Begin
  Assign(input,'Ventas.txt');
  Assign(output,'Ventas.dat');
  Reset(input);
  Rewrite(output);
  centinela.idProd := 'ZZZ99';
  Readln(input,carga.idProd,b,carga.nombre,b,carga.cantProd);
  While Not Eof(input) Do
    Begin
      ReadLn(input,actual.idProd,b,actual.nombre,b,actual.cantProd);
      If actual.idProd = carga.idProd Then
        carga.cantProd := carga.cantProd + actual.cantProd
      Else
        Begin
          write(output,carga);
          carga := actual;
        End;
    End;
  Write(output, carga);
  Write(output,centinela);
  Close(output);
  Close(input);

End;
Procedure cargadorProveedores(Var output:archTProv);

Var 
  actual,centinela: tProveedores;
  b:char;
  input: text;
Begin
  Assign(input,'Proveedores.txt');
  Assign(output,'Proveedores.dat');
  Reset(input);
  Rewrite(output);
  centinela.idProd :=  'ZZZ99';
  While Not EoF(input) Do
    Begin
      With actual Do
        Readln(input,idProd,b,nombreProv,b,precio,tardanza);
      write(output,actual);
    End;
  write(output,centinela);
  close(output);
  close(input);
End;
Procedure cargadorMinimos(Var output:archTMins);

Var 
  actual,centinela : tMinimos;
  b:char;
  input: Text;
Begin
  Assign(input,'Minimos.txt');
  Assign(output,'Minimos.dat');
  Reset(input);
  Rewrite(output);
  centinela.idProd := 'ZZZ99';
  While Not Eof(input) Do
    Begin
      Readln(input,actual.idProd,b,actual.cantCrit,actual.cantMin,actual.cantHolgura,actual.cantMax);
      write(output, actual);
    End;
  write(output, centinela);
  close(output);
  close(input);
End;
Var
  stock,ventas:   archTProd;
  proveedores: archTProv;
  reservas: archTMins;
Begin
  cargadorStock(stock);
  cargadorVentas(ventas);
  cargadorProveedores(proveedores);
  cargadorMinOpertivo(reservas);
  readln();
End.

%%Pseudocode Moravec
%%
%Calculo de las diferencias en cuatro orientaciones
h diferencias en horizontal
v diferencias en vertical
d1 diferencias en diagonal 1
d2 diferencias en diagonal 2

%%
%Acumulacion de las diferencias en el entorno
Para todo pixel en (i,j)
hh(i,j) suma diferencias en valor absoluta de la ventana 3x3 centrada en i.j de h
vv(i,j) suma diferencias en valor absoluta de la ventana 3x3 centrada en i.j de v
diag1(i,j) suma diferencias en valor absoluta de la ventana 3x3 centrada en i.j de d1
diag2(i,j) suma diferencias en valor absoluta de la ventana 3x3 centrada en i.j de d2
%%
%Obtener el valor minimo de entre las cuatro orientaciones de las
%diferencias acumuladas
c(i,j) = min(hh(i,j,vv(i,j),diag1(i,j),diag2(i,j))

%normalizar c para llevarlo al rango 0-1
cmax = c/max(c)

para cada punto (i,j) en c pasa a ser esquina si:
 Es el maximo de su entorno 3x3 y el valor de cmax(i,j) es mayor que un umbral T.
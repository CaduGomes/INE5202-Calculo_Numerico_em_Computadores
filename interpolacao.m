
clear
clc

x=[-1 0 1];
y=[4 1 -1];

n=length(x); # tamanho do vetor
for i=1:n
   for j=1:n
     V(i, j)=x(i)^(j-1);
   end
end


V
det(V)
cond(V)

a=V\y' #se não fosse no octave usaria gauss = 1-2,5x+0,5x^2

# teste para ver se o valor da curva realmente passa pelos pontos
xx=-0.5;
p=0;
for i=1:n
  p=p+a(i)*xx^(i-1);
end

p

for i=1:n
  px(i)=0;
  for j=1:n
    px(i)=px(i)+a(j)*x(i)^(j-1);
  endfor
end

plot(x,y,'o')
grid
hold on
plot(x,px)

#criando uma tabela maior de numeros para suavizar o gráfico
x1=[min(x):0.25:max(x)];
n1=length(x1);

for i=1:n1
  px(i)=0;
  for j=1:n
    px(i)=px(i)+a(j)*x1(i)^(j-1);
  endfor
end

px
y

grid
hold on
plot(x1,px, 'r')
plot(xx,p, '*g')
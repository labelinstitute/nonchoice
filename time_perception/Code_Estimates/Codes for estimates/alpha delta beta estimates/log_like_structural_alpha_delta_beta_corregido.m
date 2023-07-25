function logl = log_like_structural_alpha_delta_beta_corregido(theta, data)

sig=.5;
alpha=theta(1,1);
delta=theta(2,1);
beta=theta(3,1);

c = data(:,2);
mnumer = data(:,3);
pratio = data(:,4);
t0 = data(:,5);
k = data(:,6);

numberObs=length(c);

res=zeros(1,numberObs);
pdf=zeros(numberObs,1);

for i=1:numberObs
     res(i)= -c(i) + (((((beta*delta^k(i))*(pratio(i)))^(1/(alpha -1 )))*mnumer(i) )/(( 1+ ((pratio(i))^(alpha/(alpha -1)))*((beta*delta^k(i))^(1/(alpha -1 )) ))))*t0(i)     +       (((((delta^k(i))*(pratio(i)))^(1/(alpha -1 )))*mnumer(i) )/( 1+ ((pratio(i))^(alpha/(alpha -1)))*((delta^k(i))^(1/(alpha -1 )) )))*(1-t0(i));
end

for i = 1:numberObs
pdf(i)=res(i)^2;
end

logl = sum(pdf);
end
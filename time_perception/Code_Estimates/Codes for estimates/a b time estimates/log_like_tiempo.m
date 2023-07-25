function logl = log_like_tiempo(theta, data)

sig=.5;
a=theta(1,1);
b=theta(2,1);
realtime = data(:,2);
estimate = data(:,3);
numberObs=length(estimate);
res=zeros(1,numberObs);
pdf=zeros(numberObs,1);

for i=1:numberObs
    res(i)=estimate(i)-a*realtime(i)^b; 
end

for i = 1:numberObs
    pdf(i)=res(i)^2;
end

logl = sum(pdf);
end




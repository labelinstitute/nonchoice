clear
clc
tic ;

load('/path/timedata.mat');

subject = datosTime(:,4); 
realtime = datosTime(:,3); 
estimate = datosTime(:,2); 
numberObs=length(subject);

data=[subject realtime estimate ]; 
n=124; 

stepsize=.1; 
theta0=.5*[1;1]; 
amin=.01;
amax=15;
bmin=.15;
bmax=1.8;
paramters_final=cell(n,1);
fval_final=zeros(n,1);
exitflag_final=zeros(n,1);

options=optimset('Display','off','MaxIter',30000,'TolX',10^-30,'TolFun',10^-30);

for k=1:n
   
    data_ind=data(((k-1)*9+1):((k-1)*9+9),:);
 
            [parameters,value,exitflag]=fminsearchbnd('log_like_tiempo',theta0,[amin bmin],[amax bmax],options,data_ind);
        parameters_final(k,1)={parameters};
        fval_final(k,1)=value;
        exitflag_final(k,1)=exitflag;

end

celldisp(parameters_final); 

time_a_b_estimates=zeros(n,3);
for i=1:9:numberObs
ind=subject(i);
time_a_b_estimates(ind,1)=ind;
time_a_b_estimates(ind,2)=parameters_final{ind}(1);
time_a_b_estimates(ind,3)=parameters_final{ind}(2);
end

cd '/path/'
save('time_a_b_estimates','time_a_b_estimates')
cd '/path/'
csvwrite('time_a_b_estimates',time_a_b_estimates)

 
clear all
clc
tic ;

load('/path/structural data.mat');
n=5;
subject = datos(:,2); 
c = datos(:,28); 
m = datos(:,35); 
r = datos(:,34); 
t = datos(:,32); 
k = datos(:,33); 

load('/path/time_a_b_estimates.mat');

t0=zeros(5580,1);
for i=1:5580
    t0(i,1)=1;
if t(i)>0
t0(i,1)=0;
end
end

numberObs=length(c);
data=[subject c m r t0 k]; 

alphamin=0.409;
alphamax=1.009;
deltamin=0.809;
deltamax=1.109;
betamin=0.509;
betamax=1.509;

alpha_lbound=.001;
alpha_ubound=2;
delta_lbound=0.001;
delta_ubound=1.5;
beta_lbound=0.001;
beta_ubound=10;

parameters_final=cell(n,1);
fval_final=zeros(n,1);
exitflag_final=zeros(n,1);
AIC=zeros(n,1);
BIC=zeros(n,1);

stepsize=.05;
sizealpha=length(alphamin:stepsize:alphamax);
sizedelta=length(deltamin:stepsize:deltamax);
sizebeta=length(betamin:stepsize:betamax);

options=optimset('Display','off','MaxIter',6000,'TolX',10^-11,'TolFun',10^-11);

for j=1:n

     data_ind=data(((j-1)*45+1):((j-1)*45+45),:);

    store_fval=zeros(sizealpha,sizedelta,sizebeta);
    store_params=cell(sizealpha,sizedelta,sizebeta);
    store_exitflag=zeros(sizealpha,sizedelta,sizebeta);
    
    for alphaval=alphamin:stepsize:alphamax
    for deltaval=deltamin:stepsize:deltamax
    for betaval=betamin:stepsize:betamax

         theta0=[alphaval;deltaval;betaval];
    
   alpha_loc=round((alphaval-alphamin)/stepsize+1);
   delta_loc=round((deltaval-deltamin)/stepsize+1);
   beta_loc=round((betaval-betamin)/stepsize+1);
     
        [parameters,value,exitflag]=fminsearchbnd('log_like_structural_alpha_delta_beta_corregido',theta0,[alpha_lbound delta_lbound beta_lbound],[alpha_ubound delta_ubound beta_ubound],options,data_ind);

        store_params(alpha_loc,delta_loc,beta_loc)={parameters};
        store_fval(alpha_loc,delta_loc,beta_loc)=value;
        store_exitflag(alpha_loc,delta_loc,beta_loc)=exitflag;
        
    end
    end
    end
    
    minval=min(min(min(store_fval(:))));
    ind = find(store_fval == minval);
    ind=ind(1);
    
   [row, z, col]=ind2sub([size(store_fval,1) size(store_fval,2) size(store_fval,3)],ind);
    
        parameters_final(j)=store_params(ind);

    fval_final(j)=store_fval(row,z,col);
    exitflag_final(j)=store_exitflag(row,z,col);
        
    AIC1(j)= 2*(3) + 2*fval_final(j);
    BIC1(j)= 2*fval_final(j) + 3*log(45);
    
end

celldisp(parameters_final);
toc;

struct_alpha_delta_beta_corregido=zeros(n,4);
for i=1:45:numberObs
ind=subject(i);
struct_alpha_delta_beta_corregido(ind,1)=ind;
struct_alpha_delta_beta_corregido(ind,2)=parameters_final{ind}(1);
struct_alpha_delta_beta_corregido(ind,3)=parameters_final{ind}(2);
struct_alpha_delta_beta_corregido(ind,4)=parameters_final{ind}(3);

end

cd '/path/'
save('struct_alpha_delta_beta_check_corregido','struct_alpha_delta_beta_check_corregido')
save('exitflag_final','exitflag_final')
cd '/path/'
csvwrite('struct_alpha_delta_beta_corregido',struct_alpha_delta_beta_corregido)
csvwrite('exitflag_final',exitflag_final)
clc
clear all
for s=1:10
 func_num=16;
 M =100;
 pop = 40; %se tienen que poner arriba de 10 individuos para que no marque error
 dim = 30;   
 FQ = 3;  
 a1 =1;
 a2 =1;
%  c1=5;
%  c2=5;
lb=-100;
ub=100;
runs=1;
fhd=str2func('cec17_func');
% for i=12:12
%     func_num=i;
    for j=1:runs
        j,
        [ bestX, fMin, FBSA_cg_curve ] = BSA2( fhd, M, pop, dim, FQ, a1, a2, lb,ub,func_num ); %Que es FES c1, c2,
%       [gbest,gbestval,PSOBSA_cg_curve]= BSA2(M,pop,FQ,c1,c2,a1,a2,lb,ub,dim,fobj);
       
        [gbestbsa,gbestvalbsa,BSA_cg_curve]= BSA3(M,pop,FQ,c1,c2,a1,a2,lb,ub,dim,fobj);  
        xbest(j,:)=bestX;
        xbest(s,j).bestX=bestX;
        fbest(s,j)=fMin;
        fbest(s,j)
    end
    f_mean(s)=mean(fbest(1,:));
    %filename1 = [ 'pruebafis2g/fun114g-' num2str(s) ];
    
    filename1 = [ 'fun114g-' num2str(s) ];
    xlswrite(filename1, fbest(s,:)')
    %xlswrite('prueba/sph',fbest);
 end

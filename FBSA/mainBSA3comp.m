clc
clear all
for s=1:1
 func_num=5;
 M =500;
 pop = 30; %se tienen que poner arriba de 10 individuos para que no marque error
 dim = 10;   
 FQ = 3;  
 a1 =1;
 a2 =1;
%  c1=1.5;
%  c2=1.5;
lb=-100;
ub=100;
runs=20;
fhd=str2func('cec17_func');
% for i=12:12
%     func_num=i;
    for j=1:runs
        j,
        [ bestX, fMin,FBSA_cg_curve ] = BSA2DivV3( fhd, M, pop, dim, FQ, a1, a2, lb,ub,func_num ); %Que es FES c1, c2,
%       [gbest,gbestval,PSOBSA_cg_curve]= BSA2(M,pop,FQ,c1,c2,a1,a2,lb,ub,dim,fobj);
        %[gbestbsa,gbestvalbsa,BSA_cg_curve]= BSA3(fhd, M,pop,FQ,c1,c2,a1,a2,lb,ub,dim,func_num);  
        
        %xbest(j,:)=bestX;
        fbsaxbest(s,j).bestX=bestX;
        fbsafbest(s,j)=fMin;
        fbsafbest(s,j)
%         
%         bsaxbest(s,j).bestX=gbestbsa;
%         bsabest(s,j)=gbestvalbsa;
%         bsabest(s,j)
    end
    f_mean1(s)=mean(fbsafbest(1,:));
    %filename1 = [ 'pruebafis2g/fun114g-' num2str(s) ];
    
    filename1 = [ 'fun114fbsag2-' num2str(s) ];
    xlswrite(filename1, fbsafbest(s,:)');
    
%     filename1 = [ 'fun114bsa-' num2str(s) ];
%     xlswrite(filename1, fbsafbest(s,:)');
    %xlswrite('prueba/sph',fbest);
end
 
figure('Position',[200 200 660 290])
%Draw search space
% subplot(1,2,1);
% func_plot(fhd);
% title('Parameter space')
% xlabel('x_1');
% ylabel('x_2');
% zlabel([fhd,'( x_1 , x_2 )'])

%Draw objective space
plot(1,1);
semilogy(FBSA_cg_curve,'Color','r')
hold on
%semilogy(BSA_cg_curve,'Color','b')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
%legend('FBSA', 'BSA')
legend('FBSA')

display(['The best solution obtained by FBSA is : ', num2str(bestX)]);
display(['The best optimal value of the objective funciton found by FBSA is : ', num2str(fMin)]);
%display(['The best solution obtained by BSA is : ', num2str(gbestbsa)]);
%display(['The best optimal value of the objective funciton found by BSA is : ', num2str(gbestvalbsa)]);


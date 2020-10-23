clear all 
clc
close all

    M = 1000;   
    pop = 30;  
    dim = 30;   
    FQ = 10;   
    c1 = 1.5;
    c2 = 1.5;
    a1 = 1;
    a2 = 1;


Function_name='F21'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[gbest,gbestval,PSOBSA_cg_curve]= BSA2(M,pop,FQ,c1,c2,a1,a2,lb,ub,dim,fobj);
[gbestbsa,gbestvalbsa,BSA_cg_curve]= BSA3(M,pop,FQ,c1,c2,a1,a2,lb,ub,dim,fobj);
%[Best_score,Best_pos,PSOGWO_cg_curve]=PSOGWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
%[Alpha_score,Alpha_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

figure('Position',[200 200 660 290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
semilogy(PSOBSA_cg_curve,'Color','r')
hold on
semilogy(BSA_cg_curve,'Color','b')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('PSOBSA', 'BSA')
%legend('PSOGWO','GWO')

display(['The best solution obtained by PSOBSA is : ', num2str(gbest)]);
display(['The best optimal value of the objective funciton found by PSOBSA is : ', num2str(gbestval)]);
display(['The best solution obtained by BSA is : ', num2str(gbestbsa)]);
display(['The best optimal value of the objective funciton found by BSA is : ', num2str(gbestvalbsa)]);

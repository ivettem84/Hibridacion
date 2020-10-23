% new research cooperation are welcome with me :  berkanaydilek@harran.edu.tr

% please cite my article
% ibrahim Berkan Aydilek, 
% A hybrid firefly and particle swarm optimization algorithm for computationally expensive numerical problems,
% Applied Soft Computing, Volume 66, May 2018, Pages 232-249


clear;
for func_no=1:15
   [down,up,dim]=test_functions_range(func_no);
   results(func_no,:) =hfpso_v3(50,30,1.49445,1.49445,down,up,dim,0.1,func_no,'test_functions');
end
results
clear all;
randscore = load('hed_R2_copy_bn_reverse_Piriform/hed_R2_copy_bn_reverse_5_Piriform_randscore.mat');
randsplit = randscore.randsplit;
randmerge = randscore.randmerge;
fscore = zeros(length(randmerge),1);
for i = 1:length(randmerge)
    fscore(i,1) = 2 * randmerge(i,1) * randsplit(i,1) / (randmerge(i,1) + randsplit(i,1));
end
% save('gt_label_fscore.mat','fscore');
max(fscore(:))
clear; close all;

randscore_hed_R2 = load('hed_R2/hed_R2_fuse_10000_original_randscore.mat');

N4 = load('NIPS/data/N4.mat');
VD2D = load('NIPS/data/VD2D.mat');
VD2D3D = load('NIPS/data/VD2D3D.mat');

N4 = N4.result;
VD2D = VD2D.result;
VD2D3D = VD2D3D.result;

randmerge_hed_R2 = randscore_hed_R2.randmerge;
randsplit_hed_R2 = randscore_hed_R2.randsplit;

randmerge_NIPS_N4 = N4.ws.prec;
randsplit_NIPS_N4 = N4.ws.rec;

randmerge_NIPS_VD2D = VD2D.ws.prec;
randsplit_NIPS_VD2D = VD2D.ws.rec;

randmerge_NIPS_VD2D3D = VD2D3D.ws.prec;
randsplit_NIPS_VD2D3D = VD2D3D.ws.rec;

figure();
hold on;
% grid on; %title('#proposals vs detection rate')



[randsplit_hed_R2, idx_hed_R2] = sort(randsplit_hed_R2);
randmerge_hed_R2 = randmerge_hed_R2(idx_hed_R2);
randsplit_hed_R2(22:2:26) = [];
randmerge_hed_R2(22:2:26) = [];
randsplit_hed_R2(21) = [];
randmerge_hed_R2(21) = [];


[randsplit_NIPS_N4, idx_NIPS_N4] = sort(randsplit_NIPS_N4');
randmerge_NIPS_N4 = randmerge_NIPS_N4(idx_NIPS_N4)';

[randsplit_NIPS_VD2D, idx_NIPS_VD2D] = sort(randsplit_NIPS_VD2D');
randmerge_NIPS_VD2D = randmerge_NIPS_VD2D(idx_NIPS_VD2D)';

[randsplit_NIPS_VD2D3D, idx_NIPS_VD2D3D] = sort(randsplit_NIPS_VD2D3D');
randmerge_NIPS_VD2D3D = randmerge_NIPS_VD2D3D(idx_NIPS_VD2D3D)';

% plot(randsplit_hed,randmerge_hed,'r','LineWidth', 3);
% plot(randsplit_hed_R,randmerge_hed_R,'g','LineWidth', 3);
xlabel('Rand split score', 'FontSize', 20); ylabel('Rand merge score', 'FontSize', 20)

plot(randsplit_NIPS_N4,randmerge_NIPS_N4,'-g','LineWidth', 3, 'MarkerSize', 10);
plot(randsplit_NIPS_VD2D,randmerge_NIPS_VD2D,'-b','LineWidth', 3, 'MarkerSize', 10);
plot(randsplit_NIPS_VD2D3D,randmerge_NIPS_VD2D3D,'-k','LineWidth', 3, 'MarkerSize', 10);
plot(randsplit_hed_R2,randmerge_hed_R2,'-r','LineWidth', 3, 'MarkerSize', 10);
xlim([0.6 1]); ylim([0.6 1]);

hleg1 = legend('N4','VD2D','VD2D3D','Ours (3-stage)');
set(hleg1,'Location','SouthWest', 'FontWeight', 'bold');

% randsplit_NIPS_VD2D(33) = 0;
% randmerge_NIPS_VD2D(33) = 0;
% randsplit_NIPS_VD2D3D(33) = 0;
% randmerge_NIPS_VD2D3D(33) = 0;
% randsplit_hed_R2(29:33) = 0;
% randmerge_hed_R2(29:33) = 0;
% fid  = fopen('prcurve_data.txt','wt');
% fprintf(fid,'%8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',[randsplit_NIPS_N4, randmerge_NIPS_N4, randsplit_NIPS_VD2D, randmerge_NIPS_VD2D, randsplit_NIPS_VD2D3D, randmerge_NIPS_VD2D3D, randsplit_hed_R2, randmerge_hed_R2]');
% fclose(fid);
% save('prcurve_data.mat', 'randsplit_NIPS_N4', 'randmerge_NIPS_N4', 'randsplit_NIPS_VD2D', 'randmerge_NIPS_VD2D', 'randsplit_NIPS_VD2D3D', 'randmerge_NIPS_VD2D3D', 'randsplit_hed_R2', 'randmerge_hed_R2');

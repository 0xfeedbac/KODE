function [out] = runsim( P, I, D, N )

set_param('model2_sim/Head/Primary_motor/PID','P',num2str(P))
set_param('model2_sim/Head/Primary_motor/PID','I',num2str(I))
set_param('model2_sim/Head/Primary_motor/PID','D',num2str(D))
set_param('model2_sim/Head/Primary_motor/PID','N',num2str(N))

sim('model2_sim')

% Find and print the few biggest acceleration peaks
max_bed_a = sort(findpeaks(abs(bed_acc.data)));
acc_peaks = max_bed_a(end-10:end)
max_plat_a = sort(findpeaks(abs(platform_acc.data)));
acc_peaks2 = max_plat_a(end-1:end)
%max_plat_a = max(abs(platform_acc.data))
out = max_plat_a(end)/max_bed_a(end);
end


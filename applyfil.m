function [out] = applyfil(f, fil)
[M, N] = size(f);
out = fil(f); % apply the filter for once;
figure()
plot(out);
saveas(gcf, str(fil)+"_once");
for x = 2:5
    out = fil(out);
end
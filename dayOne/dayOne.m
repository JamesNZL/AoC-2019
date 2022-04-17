fileID = fopen('input.txt', 'r');
modules = fscanf(fileID, '%d');
fclose(fileID);

fuels = modules;

for i = 1:length(modules)
    fuels(i) = CalculateFuel(modules(i));
end

disp(sum(fuels));
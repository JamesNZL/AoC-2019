fileID = fopen('input.txt', 'r');
modules = fscanf(fileID, '%d');
fclose(fileID);

fuels = floor(modules / 3) - 2;

disp(sum(fuels));
function fuelRequired = CalculateFuel(mass)

fuelRequired = 0;
fuelRecursive = floor(mass / 3) - 2;

while (fuelRecursive > 0)
    fuelRequired = fuelRequired + fuelRecursive;
    fuelRecursive = floor(fuelRecursive / 3) - 2;
end
    
end
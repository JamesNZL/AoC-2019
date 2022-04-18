clear;

PUZZLE_START = 273025;
PUZZLE_END = 767253;

validPasswords = 0;

for n = PUZZLE_START:PUZZLE_END
    password = num2str(n);
    hasDouble = false;
    hasDecrease = false;
    
    for i = 2:length(password)
        hasDouble = hasDouble || password(i - 1) == password(i);
        hasDecrease = hasDecrease || password(i) < password(i - 1);
    end
    
    validPasswords = validPasswords + (hasDouble && ~hasDecrease);
end

disp(validPasswords);
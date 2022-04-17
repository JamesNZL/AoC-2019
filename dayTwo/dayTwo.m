clear;

fileID = fopen('input.txt', 'r');
integers = fscanf(fileID, '%d,');
fclose(fileID);

position = 0;

integers(1 + 1) = 12;
integers(2 + 1) = 2;

while (position < length(integers) && GetIntAtPos(integers, position) ~= 99)
    switch GetIntAtPos(integers, position)
        case 1
            integers(GetIntAtPos(integers, position + 3) + 1) = integers(GetIntAtPos(integers, position + 1) + 1) + integers(GetIntAtPos(integers, position + 2) + 1);
        case 2
            integers(GetIntAtPos(integers, position + 3) + 1) = integers(GetIntAtPos(integers, position + 1) + 1) * integers(GetIntAtPos(integers, position + 2) + 1);
        case 99
            break;
        otherwise
            disp('Unknown opcode!' + num2str(GetIntAtPos(integers, position)));
            break;
    end
    
    position = position + 4;
end

disp(integers(0 + 1));

function integer = GetIntAtPos(integers, position)
    % because MATLAB is a 1-indexed language
    integer = integers(position + 1);
end
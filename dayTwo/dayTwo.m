clear;

fileID = fopen('input.txt', 'r');
program = fscanf(fileID, '%d,');
fclose(fileID);

OUTPUT = 19690720;

alreadyTried = [];

memory = program;
i = 0;
while (memory(0 + 1) ~= OUTPUT)
    [noun, verb] = GenerateNounAndVerb(alreadyTried);
    alreadyTried(end + 1) = 100 * noun + verb;

    memory = program;
    memory(1 + 1) = noun;
    memory(2 + 1) = verb;

    instrPtr = 0;
    while (instrPtr < length(memory) && GetIntAtPos(memory, instrPtr) ~= 99)
        switch GetIntAtPos(memory, instrPtr)
            case 1
                memory(GetIntAtPos(memory, instrPtr + 3) + 1) = memory(GetIntAtPos(memory, instrPtr + 1) + 1) + memory(GetIntAtPos(memory, instrPtr + 2) + 1);
            case 2
                memory(GetIntAtPos(memory, instrPtr + 3) + 1) = memory(GetIntAtPos(memory, instrPtr + 1) + 1) * memory(GetIntAtPos(memory, instrPtr + 2) + 1);
            case 99
                break;
            otherwise
                disp('Unknown opcode!' + num2str(GetIntAtPos(memory, instrPtr)));
                break;
        end

        instrPtr = instrPtr + 4;
    end
end
    
disp(100 * noun + verb);

function integer = GetIntAtPos(program, instrPtr)
    % because MATLAB is a 1-indexed language
    integer = program(instrPtr + 1);
end

function [noun, verb] = GenerateNounAndVerb(alreadyTried)
    noun = randi([0, 99]);
    verb = randi([0, 99]);
    
    if (any(ismember(alreadyTried, 100 * noun + verb)))
        [noun, verb] = GenerateNounAndVerb(alreadyTried);
    end
end
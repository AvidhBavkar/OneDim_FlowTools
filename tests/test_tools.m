%% Some things common across all tests.
classdef test_tools
properties
end
methods(Static)
    function success = validate(fname, input,truth,tolerance,display)
        if abs(input-truth)>tolerance
            success=false;
            fprintf('\tFAILED!\t\t%s\n', fname);
            fprintf('\t\t\t\tTruth: %.3f\tOutput: %.3f\n', truth, input);
        else
            success=true;
            fprintf('\tSUCCESS\t\t%s\n', fname);
            if(display)
                fprintf('\t\t\t\tTruth: %.3f\tOutput: %.3f\n', truth, input);
            end
        end
    end

end
end
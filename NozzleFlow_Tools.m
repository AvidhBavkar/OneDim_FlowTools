%% Nozzle Flow Tools
% Some math for Nozzle Flow
classdef NozzleFlow_Tools
methods(Static)
    function exit_mach = exit_mach_WITH_shock(gamma, upstream_ptot, exit_pstat, throat_area, exit_area)
        % Gets the nozzle exit mach ASSUMING a shock is in the nozzle
        g=gamma;
        gp1=gamma+1;
        gm1=gamma-1;
        p_ratio = upstream_ptot./exit_pstat;
        a_ratio = throat_area./exit_area;
    
        exit_mach = sqrt(1/gm1 .* (...
            -1 + ( 1 + 2.*gm1.*(2/gp1).^(gp1/gm1).*...
            (p_ratio.*a_ratio).^2).^(1./2)));
    end
    
    function shock_pTOTratio = shock_totPratio(gamma, upstream_ptot, exit_pstat, throat_area, exit_area)
        % Gets the total pressure ratio across a shock assuming it exists
        % in the nozzle
        
        exit_mach = NozzleFlow_Tools.exit_mach_WITH_shock(gamma, upstream_ptot, exit_pstat, throat_area, exit_area);
        exit_totstat_pratio = IsentropicFlow_Tools.totstat_pratio_FROM_mach(gamma, exit_mach);
        shock_pTOTratio = exit_pstat./upstream_ptot.*exit_totstat_pratio;
    end


    function a_ratio = shock_a_ratio(gamma, upstream_ptot, exit_pstat, throat_area, exit_area)
        % Gets the ratio (A/A*) at which a normal shock exists in a nozzle
        % 
        % See also nozzle_exit_mach_shock_in_nozzle

        shock_pTOTratio = NozzleFlow_Tools.shock_totPratio(gamma, upstream_ptot, exit_pstat, throat_area, exit_area);
        beforeshock_mach = NormalShock_Tools.upstream_mach_FROM_totPratio(gamma, shock_pTOTratio, 1);
        a_ratio = IsentropicFlow_Tools.aratio_FROM_mach(gamma, beforeshock_mach);
    end
end
end
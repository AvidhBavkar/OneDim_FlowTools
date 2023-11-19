%% Contains some math for normal shock relations
classdef NormalShock_Tools
properties
    isentropic = IsentropicFlow_Tools
end
methods
    function nozzle_exit_mach_when_shock_in_nozzle(obj, gamma, upstream_ptot, exit_pstat, throat_area, exit_area)
        g=gamma;
        gp1=gamma+1;
        gm1=gamma-1;
        p_ratio = upstream_ptot./exit_pstat;
        a_ratio = throat_area./exit_area;
    
        exit_mach = sqrt(1/gm1 .* (...
            -1 + ( 1 + 2.*gm1.*(2/gp1).^(gp1/gm1).*...
            (p_ratio.*a_ratio).^2)).^(1./2));
    end
    
    function shock_area_
    end

end
end
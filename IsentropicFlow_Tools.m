%% Isentropic Flow Tools
% Some math for 1-D isentropic flow
classdef IsentropicFlow_Tools
properties
end
methods(Static)
    function mach = mach_FROM_a_ratio(gamma, a_ratio, is_supersonic)
        % Numerically determines mach number from area ratio
        % 
        % is_supersonic: Flag to set true if supersonic
        % Solves Eq (9) in https://www.grc.nasa.gov/www/k-12/airplane/isentrop.html

        gp1 = gamma+1;
        gm1 = gamma-1;

        options = optimoptions('fmincon','disp','off');
        fun = @(m_mach) abs(a_ratio - (...
            (gp1./2).^(-(gp1./(2.*gm1)))...
            .*(1+(gm1)./2.*m_mach.^2).^((gp1)/(2.*gm1))./(m_mach)));

%         fun = @(m_mach) abs(a_ratio - ...
%             (m_mach + 2));

        if is_supersonic == true
            mach_max = 100;
            mach_min = 1;
            mach_guess = 2;
        else
            mach_max = 1;
            mach_min = 0;
            mach_guess = 0.5;
        end
        
        mach = fmincon( ...
            fun, mach_guess, [],[],[],[], mach_min, mach_max,[],options);
    end

    function aratio = aratio_FROM_mach(gamma, mach)
        % area ratio from mach number
        % 
        % is_supersonic: Flag to set true if supersonic
        % Solves Eq (9) in https://www.grc.nasa.gov/www/k-12/airplane/isentrop.html

        gp1 = gamma+1;
        gm1 = gamma-1;

        aratio = (gp1./2).^(-(gp1./(2.*gm1)))...
            .*(1+(gm1)./2.*mach.^2).^((gp1)/(2.*gm1))./(mach);
    end
    
    function tratio = totstat_tratio_FROM_mach(gamma, mach)
        tratio = 1 + (gamma-1)./2 .* mach.^2;
    end
    function pratio = totstat_pratio_FROM_mach(gamma, mach)
        g = gamma;
        gp1 = gamma+1;
        gm1 = gamma-1;

        pratio = (1+gm1./2.*mach.^2).^(g./gm1);
    end
    function chk = test_min(y)
        fun = @(x) abs(y-(x+2));
        
        options = optimoptions('fmincon','disp','off');


        chk = fmincon( ...
            fun, 10, [],[],[],[], 0, 100,[],options);
    end
end
end
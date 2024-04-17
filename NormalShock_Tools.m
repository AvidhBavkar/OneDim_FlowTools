%% Normal Shock Tools
% Some math for 1-D flow across a normal shock
classdef NormalShock_Tools
methods(Static)
    function mach = upstream_mach_FROM_totPratio(gamma, totp_aftershock, totp_beforeshock)
        
        g = gamma;
        gp1 = gamma+1;
        gm1 = gamma-1;
        target_ptotratio = totp_aftershock./totp_beforeshock;
    
        options = optimoptions('fmincon','disp','off');
%         fun= @(m_mach) abs(target_ptotratio - ...
%             ( ((0.5.*gp1.*m_mach.^2).^(g/gm1).*(1+0.5.*gm1.*m_mach.^2).^(g/(1-g)))./(((2.*g./g+1).*m_mach.^2-(gm1/gp1)).^(1/gm1)) ...
%             ));
        
        fun= @(m_mach) abs(target_ptotratio - ...
            ((gp1.*m_mach.^2)./(gm1.*m_mach.^2+2)).^(g/gm1).*...
            ((gp1)./(2.*g.*m_mach.^2-gm1)).^(1/gm1)...
        );

        
        mach_min = 1; %Inlet Mach must be supersonic for shock to exist
        mach_max = 100;
        mach_guess = 2.5;

        mach = fmincon( ...
            fun, mach_guess, [],[],[],[], mach_min, mach_max,[],options);

    end
    
    function mach = downstream_mach_FROM_upstream_mach(gamma, up_mach)
        g = gamma;
        gp1 = g+1;
        gm1 = g-1;
        mach = sqrt((1+gm1./2.*up_mach.^2)./(g.*up_mach.^2-gm1/2));
    end

    function mach = upstream_mach_FROM_statPratio(gamma, pratio)
        g = gamma;
        gp1 = g+1;
        gm1 = g-1;
           
        mach = sqrt((pratio.*gp1+gm1)./(2.*g));
    end

    function pratio = pratio_FROM_mach(gamma, mach)
        g = gamma;
        gp1 = g+1;
        gm1 = g-1;
        
        pratio = (2.*g.*mach.^2-gm1)./gp1;
    end
end
end
%% Test of Flow Tools
% Utilizes Reference values found in 334 compressible flow table and past
% homework problems to check all my tools out.
reset();
show_successful_values = false;
% clc;
% pause;
%% ~~~~~~~~~~TEST FRAMEWORK:~~~~~~~~~~
%% Test test_min:
truth = 4;
test_tools.validate("Test of Test",...
    IsentropicFlow_Tools.test_min(6), ...
    truth, ...
    0.01, ...
    show_successful_values);
%% ~~~~~~~~~~ISENTROPIC TOOL:~~~~~~~~~~
%% Test mach_FROM_a_ratio SUPERSONIC:
%TRUTH SOURCE: Calculator at bottom of https://www.grc.nasa.gov/www/k-12/airplane/isentrop.html
gamma = 1.4;
truth_mach=2.2;
a_ratio = 2.005;
test_tools.validate("mach_FROM_a_ratio supersonic",...
    IsentropicFlow_Tools.mach_FROM_a_ratio(gamma, a_ratio, true),...
    truth_mach,...
    0.01,...
    show_successful_values);

reset();

%% Test mach_FROM_a_ratio SUBSONIC:
%TRUTH SOURCE: Calculator at bottom of https://www.grc.nasa.gov/www/k-12/airplane/isentrop.html
gamma = 1.4;
truth_mach=0.30;
a_ratio = 2;
test_tools.validate("mach_FROM_a_ratio subsonic",...
    IsentropicFlow_Tools.mach_FROM_a_ratio(gamma, a_ratio, false),...
    truth_mach,...
    0.01,...
    show_successful_values);

reset();

%% Test aratio_FROM_mach:
%TRUTH SOURCE: Calculator at bottom of https://www.grc.nasa.gov/www/k-12/airplane/isentrop.html
gamma = 1.4;
mach=10;
truth_aratio = 535.937;
test_tools.validate("aratio_FROM_mach",...
    IsentropicFlow_Tools.aratio_FROM_mach(gamma, mach),...
    truth_aratio,...
    0.01,...
    show_successful_values);

reset();

%% Test totstat_tratio_FROM_mach:
%TRUTH SOURCE: AAE 334 Compressible Flow Table
gamma = 1.4;
mach=3.5;
truth_tratio = 3.45;
test_tools.validate("totstat_tratio_FROM_mach",...
    IsentropicFlow_Tools.totstat_tratio_FROM_mach(gamma, mach),...
    truth_tratio,...
    0.01,...
    show_successful_values);

reset();


%% Test totstat_pratio_FROM_mach:
%TRUTH SOURCE: AAE 334 Compressible Flow Table
gamma = 1.4;
mach=3.5;
truth_pratio = 76.272;
test_tools.validate("totstat_pratio_FROM_mach",...
    IsentropicFlow_Tools.totstat_pratio_FROM_mach(gamma, mach),...
    truth_pratio,...
    0.01,...
    show_successful_values);

reset();

%% ~~~~~~~~~~NORMAL SHOCK TOOL:~~~~~~~~~
%% Test upstream_mach_FROM_totPratio:
%TRUTH SOURCE: AAE 334 Shock Table Spreadsheet
gamma = 1.4;
ptotaftershock = 0.139;
ptotbeforeshock = 1;

truth_mach = 4.0;
test_tools.validate("upstream_mach_FROM_totPratio",...
    NormalShock_Tools.upstream_mach_FROM_totPratio(gamma, ptotaftershock, ptotbeforeshock),...
    truth_mach,...
    0.01,...
    show_successful_values);

reset();

%% Test downstream_mach_FROM_upstream_mach:
%TRUTH SOURCE: AAE 334 Shock Table Spreadsheet
gamma = 1.4;
upstream_mach = 5.5;
truth_downstreammach = 0.409;
test_tools.validate("downstream_mach_FROM_upstream_mach",...
    NormalShock_Tools.downstream_mach_FROM_upstream_mach(gamma, upstream_mach),...
    truth_downstreammach,...
    0.01,...
    show_successful_values);

reset();


%% Test upstream_mach_FROM_statPratio:
%TRUTH SOURCE: https://devenport.aoe.vt.edu/aoe3114/calc.html
gamma = 1.4;
pratio = 2;
truth_upstreammach = 1.36;
test_tools.validate("upstream_mach_FROM_statPratio",...
    NormalShock_Tools.upstream_mach_FROM_statPratio(gamma, pratio),...
    truth_upstreammach,...
    0.01,...
    show_successful_values);

reset();


%% Test pratio_FROM_mach:
%TRUTH SOURCE: AAE514 Notes
gamma = 1.4;
mach = 1.352;
truth_pratio = 1.96;
test_tools.validate("pratio_FROM_mach",...
    NormalShock_Tools.pratio_FROM_mach(gamma, mach),...
    truth_pratio,...
    0.01,...
    show_successful_values);

reset();

%% ~~~~~~~~~~NOZZLE FLOW TOOL:~~~~~~~~~
%% Test exit_mach_WITH_shock:
%TRUTH SOURCE: AAE 334 HW10 Problem #2
gamma = 1.4;
upstream_ptot = 100;
backpressure = 50;
throat_area = pi;
exit_area = 4.*pi;
truth_mach = 0.287;
test_tools.validate("exit_mach_WITH_shock",...
    NozzleFlow_Tools.exit_mach_WITH_shock(gamma, upstream_ptot, backpressure, throat_area, exit_area),...
    truth_mach,...
    0.01,...
    show_successful_values);

reset();

%% Test shock_a_ratio:
%TRUTH SOURCE: AAE 334 HW10 Problem #2
gamma = 1.4;
upstream_ptot = 100;
backpressure = 50;
throat_area = pi;
exit_area = 4.*pi;
truth_shock_aratio = 2.463;
test_tools.validate("shock_a_ratio",...
    NozzleFlow_Tools.shock_a_ratio(gamma, upstream_ptot, backpressure, throat_area, exit_area),...
    truth_shock_aratio,...
    0.01,...
    show_successful_values);

reset();
%% Test exit_mach_WITH_shock:
%TRUTH SOURCE: AAE 334 HW10 Problem #2
gamma = 1.4;
upstream_ptot = 100;
backpressure = 50;
throat_area = pi;
exit_area = 4.*pi;
truth_mach = 0.287;
test_tools.validate("exit_mach_WITH_shock",...
    NozzleFlow_Tools.exit_mach_WITH_shock(gamma, upstream_ptot, backpressure, throat_area, exit_area),...
    truth_mach,...
    0.01,...
    show_successful_values);

reset();

%% Test shock_totPratio:
%TRUTH SOURCE: AAE 334 HW10 Problem #2
gamma = 1.4;
upstream_ptot = 100;
backpressure = 50;
throat_area = pi;
exit_area = 4.*pi;
truth_shock_totPratio = 0.529;
test_tools.validate("shock_totPratio",...
    NozzleFlow_Tools.shock_totPratio(gamma, upstream_ptot, backpressure, throat_area, exit_area),...
    truth_shock_totPratio,...
    0.01,...
    show_successful_values);

reset();

%% RESET FUNCTION (KEEP AT END):
function reset
    clear;
    addpath ../
    global test_utils;
    global isentropic_tool;
    global step;
    test_utils = test_tools;
    isentropic_tool = IsentropicFlow_Tools;
    step = false;
end
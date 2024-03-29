*** (C) 2008-2017 Potsdam Institute for Climate Impact Research (PIK),
*** authors, and contributors see AUTHORS file
*** This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** Contact: magpie@pik-potsdam.de

p16_volumetric_conversion("wood") = 632.5;
p16_volumetric_conversion("woodfuel") = 307.1;

f16_forestry_demand_iso(t_all,iso,"woodfuel") = f16_forestry_demand_iso(t_all,iso,"woodfuel") * 0.50;

fm_forestry_demand(t_all,i,kforestry) =
									sum(i_to_iso(i,iso),f16_forestry_demand_iso(t_all,iso,kforestry));

*** Only needed to fix the time step length miscalculation from t_all in y1995.
*** The 1995 value for yeardiff needs to be one but with m_yeatrdiff on t_all its is 5.
*** Only the t values will be overwritten using this fix.
*** Could also make a dollar condition with $(ord(t)=1). Fix later.

fm_forestry_demand(t,i,kforestry) =
										sum(i_to_iso(i,iso),f16_forestry_demand_iso(t,iso,kforestry));

*v32_hvarea_forestry.fx(j,kforestry,"ac0") = 0;

** Read exogenous rotation length
*p32_rot_length(t,i) = f32_rot_length(t,i,"%c32_rot_length%");
*p32_rot_length_estb(t,i) = f32_rot_length(t,i,"%c32_rot_length_estb%");

** Check for calcultation of time factor
*pm_time_diff(t) = (5$(ord(t)=1)+(m_yeardiff(t)*(0.985**m_yeardiff(t)))$(ord(t)>1));
pm_time_diff(t) = m_yeardiff(t);

p32_carbon_density_ac_nat(t,j,ac) = m_growth_vegc(0,fm_carbon_density(t,j,"other","vegc"),sum(clcl,fm_climate_class(j,clcl)*fm_growth_par(clcl,"k")),sum(clcl,fm_climate_class(j,clcl)*fm_growth_par(clcl,"m")),(ord(ac)-1));

p32_carbon_density_ac_marg(t,j,ac_sub) = p32_carbon_density_ac_nat(t,j,ac_sub) - p32_carbon_density_ac_nat(t,j,ac_sub-1);

p32_IGR(t,j,ac_sub) = (p32_carbon_density_ac_marg(t,j,ac_sub)/p32_carbon_density_ac_nat(t,j,ac_sub))$(p32_carbon_density_ac_nat(t,j,ac_sub)>0) + 1$(p32_carbon_density_ac_nat(t,j,ac_sub)<0.0001);
p32_IGR("y1995",j,"ac0") = 1;
p32_interest(t,i,scen12) = fm_interest(t,scen12);
p32_rot_flg(t,j,ac,scen12) = 1$((p32_IGR(t,j,ac) - sum(cell(i,j),p32_interest(t,i,scen12)))>0) + 0$((p32_IGR(t,j,ac) - sum(cell(i,j),p32_interest(t,i,scen12)))>0);
p32_rot_final(t,j,scen12) = sum(ac,p32_rot_flg(t,j,ac,scen12)) * 5;
p32_rot_final(t,j,scen12)$(p32_rot_final(t,j,scen12)>90) = 90;
p32_rot_final(t_future,j,scen12) = p32_rot_final("y2100",j,scen12);

p32_rot_corrected(t_all,j,rotation_type) = sum(int_to_rl(rotation_type,scen12),p32_rot_final(t_all,j,scen12));

p32_rot_length(t,j) = p32_rot_corrected(t,j,"%c32_rotation_harvest%");
*p32_rot_length(t,j) = p32_rot_final("y1995",j);
p32_rot_length_estb(t,j) = p32_rot_corrected(t,j,"%c32_rotation_estb%");

*p32_rot_length(t,j) = f32_rot_length_cellular(t,j);
*p32_rot_length_estb(t,j) = f32_rot_length_cellular(t,j);
*p32_rot_length_estb(t,i) = 30;
*p32_rot_length_estb(t,j) = p32_rot_length(t,j);

pc32_rot_length(t,j) = p32_rot_length(t,j);
pm_rot_length_estb(t,j) = p32_rot_length_estb(t,j);

** rotation length in 5 year time steps
p32_rotation_cellular(t,j) = ceil(p32_rot_length(t,j)/5);
p32_rotation_cellular_estb(t,j) = ceil(p32_rot_length_estb(t,j)/5);

** Define protect and harvest setting
protect32(t,j,ac_sub) = no;
protect32(t,j,ac_sub) = yes$(ord(ac_sub) < p32_rotation_cellular(t,j));

harvest32(t,j,ac_sub) = no;
harvest32(t,j,ac_sub) = yes$(ord(ac_sub) >= p32_rotation_cellular(t,j));

** Afforestation policies NPI and NDCs
p32_aff_pol(t,j) = f32_aff_pol(t,j,"%c32_aff_policy%");
p32_land(t,j,type32,ac) = 0;

* Calculate the remaining exogenous afforestation with respect to the maximum exogenous target over time.
* `p32_aff_togo` is used to adjust `s32_max_aff_area` in the constraint `q32_max_aff`.
p32_aff_togo(t) = sum(j, smax(t2, p32_aff_pol(t2,j)) - p32_aff_pol(t,j));

** divide initial forestry area by number of age classes within protect32
** since protect32 is TRUE for ord(ac_sub) < p32_rotation_cellular(j) there is one additional junk which is assigned to ac0
p32_plant_ini_ac(j) = pm_land_start(j,"forestry")/p32_rotation_cellular("y1995",j);
*p32_plant_ini_ac(j) = pm_land_start(j,"forestry")/sum(cell(i,j), ceil(f32_rot_length(i,"init")/5));

p32_land("y1995",j,"plant",ac_sub)$(protect32("y1995",j,ac_sub)) = p32_plant_ini_ac(j);
p32_land("y1995",j,"plant","ac0") = p32_plant_ini_ac(j);

** initial shifting of age classes
p32_land(t,j,"plant",ac)$(ord(ac) > 1) = p32_land(t,j,"plant",ac-1);
** reset ac0 to zero
p32_land("y1995",j,"plant","ac0") = 0;

**************************************************************************************
f32_production_ratio(t_all,"MEA") = f32_production_ratio("y1995","MEA");
pm_production_ratio_ext(t_ext,i) = f32_production_ratio("y1995",i);
pm_production_ratio_ext(t_all,i) = f32_production_ratio("y1995",i);

pm_production_ratio_ext(t_ext,i) = f32_production_ratio("y2100",i);
pm_production_ratio_ext(t_all,i) = f32_production_ratio(t_all,i);

*** Hardcoding bugfix
*f32_forestry_management("USA") = 15;
*f32_forestry_management("IND") = 15;
*f32_forestry_management("EUR") = 12;
*f32_forestry_management("JPN") = 7;
*f32_forestry_management("NEU") = 7;
f32_forestry_management("USA","plantations") = 7;
p32_management_factor(j,mgmt_type) = sum(cell(i,j),ceil(f32_forestry_management(i,"plantations")/f32_forestry_management(i,"natveg")));
p32_management_factor(j,"high") = p32_management_factor(j,"normal") * 3;
**************************************************************************

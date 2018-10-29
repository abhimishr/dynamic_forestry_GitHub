** Looping over cells to calculate "protected" part of avialable plantations so that the model can use this
** to meet future demand rather than only depending on establishing "new" plantations.
** The idea is that not all the available plantations are needed to meet the demand in current time step.
** both p32_protect_avail and v32_avail_reuse.l are initialized as 0.

loop(j,
p32_protect_avail(t_alias,j) = p32_protect_avail(t_alias,j) + v32_avail_reuse.l(j)$(m_year(t_alias) >= m_year(t) AND m_year(t_alias) <= m_year(t) + sum(cell(i,j), p32_rot_length(i)));
);

*v32_land.lo(j,"plant","xxxxxxxxxx") = p32_protect_avail(t,j);
display p32_protect_avail;


** BEGIN INDC **

**limit demand for afforestation if not enough area for conversion is available
*calc potential afforestation (cropland + pasture)
        p32_aff_pot(t,j) = pcm_land(j,"crop") + pcm_land(j,"past");
*correct indc forest stock based on p32_aff_pot
        if((ord(t) > 1),
                p32_aff_pol(t,j)$(p32_aff_pol(t,j) - p32_aff_pol(t-1,j) > p32_aff_pot(t,j)) = p32_aff_pol(t-1,j) + p32_aff_pot(t,j);
        );
*calc indc afforestation per time step based on forest stock changes
        p32_aff_pol_timestep("y1995",j) = 0;
        p32_aff_pol_timestep(t,j)$(ord(t)>1) = p32_aff_pol(t,j) - p32_aff_pol(t-1,j);

** END INDC **
s32_shift = (5/5)$(ord(t)=1);
s32_shift = (m_timestep_length/5)$(ord(t)>1);

if((ord(t)>1),
*example: ac10 in t = ac5 (ac10-1) in t-1 for a 5 yr time step (s32_shift = 1)
p32_land(t,j,type32,ac)$(ord(ac) > s32_shift) = p32_land(t-1,j,type32,ac-s32_shift);
*account for cases at the end of the age class set (s32_shift > 1) which are not shifted by the above calculation
p32_land(t,j,type32,"acx") = p32_land(t,j,type32,"acx") + sum(ac$(ord(ac) > card(ac)-s32_shift), p32_land(t-1,j,type32,ac));
);
*should not be necessary. Just to be on the save side
p32_land(t,j,type32,"ac0") = 0;

*calculate v32_land.l
v32_land.l(j,type32,ac) = p32_land(t,j,type32,ac);
pc32_land(j,type32,ac) = p32_land(t,j,type32,ac);
vm_land.l(j,"forestry") = sum((type32,ac), p32_land(t,j,type32,ac));
pcm_land(j,"forestry") = sum((type32,ac), p32_land(t,j,type32,ac));

***bounds for plantations
*** ac0 can increase
v32_land.lo(j,"plant","ac0") = 0;
v32_land.up(j,"plant","ac0") = Inf;

*fix land with rotation length
v32_land.fx(j,"plant",ac_sub)$protect32(j,ac_sub) = pc32_land(j,"plant",ac_sub);

*set upper bound for plantations after rotation length
v32_land.up(j,"plant",ac_sub)$harvest32(j,ac_sub) = pc32_land(j,"plant",ac_sub);

*fix C-price induced afforestation and indc to zero (for testing)
v32_land.fx(j,"aff",ac) = 0;
v32_land.fx(j,"indc",ac) = 0;

**C-price induced afforestation
*boundaries afforestation mask (albedo)
*v32_land.lo(j,"aff","new") = 0;
*v32_land.up(j,"aff","new") = f32_aff_mask(j) * sum(land, pcm_land(j,land));
*no afforestation if carbon density <= 20 tc/ha
*v32_land.fx(j,"aff","new")$(fm_carbon_density(t,j,"forestry","vegc") <= 20) = 0;
*m_boundfix(v32_land,(j,"aff","new"),l,10e-5);

display pc32_land;
display v32_land.l,vm_land.lo,v32_land.up;
f32_calib_gs("IND") = 1.2;
p32_yield_forestry_ac(t,j,ac_sub) =
      sum(cell(i,j),p32_forestry_management(i))
      * (2)
      * pm_carbon_density_ac(t,j,ac_sub,"vegc")
      * 0.85
      / sum(clcl,pm_climate_class(j,clcl) * pm_bcef(ac_sub,clcl))
      ;


p32_yield_natveg(t,j,ac_sub) =
      (2)
      * pm_carbon_density_ac(t,j,ac_sub,"vegc")
      * 0.80
      / sum(clcl,pm_climate_class(j,clcl) * pm_bcef(ac_sub,clcl))
      ;


p32_yield_primforest(t,j) =
      (2)
      * pm_carbon_density_ac(t,j,"acx","vegc")
      * 0.75
      / sum(clcl,pm_climate_class(j,clcl) * pm_bcef("acx",clcl))
      ;
$ontext
p32_yield_forestry_ac(t,j,ac) =
*    sum(cell(i,j),p32_forestry_management(i) * f32_calib_gs(i))
    sum(cell(i,j), f32_calib_gs(i))
    * m_growing_stock(pm_carbon_density_ac(t,j,ac,"vegc"));

p32_yield_natveg(t,j,ac) =
*	 sum(cell(i,j),f32_calib_gs(i)) *
     m_growing_stock(pm_carbon_density_ac(t,j,ac,"vegc"));

p32_yield_primforest(t,j) =
*	sum(cell(i,j),f32_calib_gs(i)) *
    m_growing_stock(fm_carbon_density(t,j,"primforest","vegc"));
$offtext

** Future demand relevant in current time step depending on rotation length
***** COULD BE MOVED AWAY TO NEW MODULE
p32_rotation_reg(i) = ord(t) + ceil(p32_rot_length(i)/5);

pc32_demand_forestry_future(i,kforestry) = sum(t_ext_forestry$(t_ext_forestry.pos = p32_rotation_reg(i)),p32_demand_ext(t_ext_forestry,i,kforestry));
pc32_selfsuff_forestry_future(i,kforestry) = sum(t_ext_forestry$(t_ext_forestry.pos = p32_rotation_reg(i)),p32_selfsuff_ext(t_ext_forestry,i,kforestry));
pc32_trade_bal_reduction_future = sum(t_ext_forestry, i32_trade_bal_reduction(t_ext_forestry))/card(t_ext_forestry);
pc32_trade_balanceflow_future(kforestry) = sum(t_ext_forestry,p32_trade_balanceflow_ext(t_ext_forestry,kforestry))/card(t_ext_forestry);
pc32_exp_shr_future(i,kforestry) = sum(t_ext_forestry$(t_ext_forestry.pos = p32_rotation_reg(i)),p32_exp_shr_ext(t_ext_forestry,i,kforestry));
pc32_production_ratio_future(i) = sum(t_ext_forestry$(t_ext_forestry.pos = p32_rotation_reg(i)),p32_production_ratio_ext(i,t_ext_forestry));
***** COULD BE MOVED AWAY TO NEW MODULE

display p32_rotation_reg;
display pc32_demand_forestry_future;
display p32_demand_ext;

*pc32_yield_forestry_future(j) = sum(ac$(ac.off = p32_rotation_cellular(j)+1), p32_yield_forestry_ac(t,j,ac));
pc32_yield_forestry_future(j) = sum(ac_sub$(ord(ac_sub) = p32_rotation_cellular(j)), p32_yield_forestry_ac(t,j,ac_sub));
display pc32_yield_forestry_future;

** Calculating future yield from already mature plantations.
** If the forest is already mature (say ac50), and we decide to use this mature "available" plantation to meet Future
** demand according to rotation length of lets say 30, then the mature "available" planattion of ac50 being used to meet demand
** in thirty years from now will be considered to have a yield of forest belonging to ac80.

loop(j,
  loop (ac_sub2,
  if(p32_rotation_cellular(j)+ord(ac_sub2) <= card(ac),
  pc32_yield_forestry_mature_future(j) = sum(ac_sub$(ord(ac_sub) = p32_rotation_cellular(j)+ord(ac_sub2)), p32_yield_forestry_ac(t,j,ac_sub));
  else
  pc32_yield_forestry_mature_future(j) = p32_yield_forestry_ac(t,j,"acx");
  );
 );
);
display pc32_yield_forestry_mature_future;

pc32_timestep = ord(t);

*** EOF presolve.gms ***
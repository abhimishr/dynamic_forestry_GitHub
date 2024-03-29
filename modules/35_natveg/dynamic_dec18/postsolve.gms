*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

*secdforest age class calculation
p35_secdforest(t,j,ac) = v35_secdforest.l(j,ac);

*other land age class calculation
p35_other(t,j,ac) = v35_other.l(j,ac);
*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov35_secdforest(t,j,ac,"marginal")                      = v35_secdforest.m(j,ac);
 ov35_other(t,j,ac,"marginal")                           = v35_other.m(j,ac);
 ov_landdiff_natveg(t,"marginal")                        = vm_landdiff_natveg.m;
 ov35_other_expansion(t,j,ac,"marginal")                 = v35_other_expansion.m(j,ac);
 ov35_other_reduction(t,j,ac,"marginal")                 = v35_other_reduction.m(j,ac);
 ov35_secdforest_reduction(t,j,ac,"marginal")            = v35_secdforest_reduction.m(j,ac);
 ov35_primforest_reduction(t,j,"marginal")               = v35_primforest_reduction.m(j);
 ov35_cost_harvest(t,i,"marginal")                       = v35_cost_harvest.m(i);
 ov35_hvarea_secdforest(t,j,kforestry,ac_sub,"marginal") = v35_hvarea_secdforest.m(j,kforestry,ac_sub);
 ov35_hvarea_other(t,j,kforestry,ac_sub,"marginal")      = v35_hvarea_other.m(j,kforestry,ac_sub);
 ov35_hvarea_primforest(t,j,kforestry,"marginal")        = v35_hvarea_primforest.m(j,kforestry);
 ov35_prod(t,j,land_natveg,kforestry,"marginal")         = v35_prod.m(j,land_natveg,kforestry);
 ov_cost_natveg(t,i,"marginal")                          = vm_cost_natveg.m(i);
 ov_prod_cell_natveg(t,j,kforestry,"marginal")           = vm_prod_cell_natveg.m(j,kforestry);
 oq35_land_secdforest(t,j,"marginal")                    = q35_land_secdforest.m(j);
 oq35_land_other(t,j,"marginal")                         = q35_land_other.m(j);
 oq35_carbon_primforest(t,j,c_pools,"marginal")          = q35_carbon_primforest.m(j,c_pools);
 oq35_carbon_secdforest(t,j,c_pools,"marginal")          = q35_carbon_secdforest.m(j,c_pools);
 oq35_carbon_other(t,j,c_pools,"marginal")               = q35_carbon_other.m(j,c_pools);
 oq35_landdiff(t,"marginal")                             = q35_landdiff.m;
 oq35_other_expansion(t,j,ac,"marginal")                 = q35_other_expansion.m(j,ac);
 oq35_other_reduction(t,j,ac,"marginal")                 = q35_other_reduction.m(j,ac);
 oq35_secdforest_reduction(t,j,ac,"marginal")            = q35_secdforest_reduction.m(j,ac);
 oq35_primforest_reduction(t,j,"marginal")               = q35_primforest_reduction.m(j);
 oq35_min_forest(t,j,"marginal")                         = q35_min_forest.m(j);
 oq35_min_other(t,j,"marginal")                          = q35_min_other.m(j);
 oq35_cost_harvest(t,i,"marginal")                       = q35_cost_harvest.m(i);
 oq35_prod_other(t,j,"marginal")                         = q35_prod_other.m(j);
 oq35_hvarea_secdforest(t,j,ac_sub,"marginal")           = q35_hvarea_secdforest.m(j,ac_sub);
 oq35_hvarea_primforest(t,j,"marginal")                  = q35_hvarea_primforest.m(j);
 oq35_hvarea_other(t,j,ac_sub,"marginal")                = q35_hvarea_other.m(j,ac_sub);
 oq35_secdforest_conversion(t,j,"marginal")              = q35_secdforest_conversion.m(j);
 oq35_cost_total(t,i,"marginal")                         = q35_cost_total.m(i);
 oq35_prod_secdforest(t,j,kforestry,"marginal")          = q35_prod_secdforest.m(j,kforestry);
 oq35_prod_primforest(t,j,kforestry,"marginal")          = q35_prod_primforest.m(j,kforestry);
 oq35_prod_cell_natveg(t,j,kforestry,"marginal")         = q35_prod_cell_natveg.m(j,kforestry);
 ov35_secdforest(t,j,ac,"level")                         = v35_secdforest.l(j,ac);
 ov35_other(t,j,ac,"level")                              = v35_other.l(j,ac);
 ov_landdiff_natveg(t,"level")                           = vm_landdiff_natveg.l;
 ov35_other_expansion(t,j,ac,"level")                    = v35_other_expansion.l(j,ac);
 ov35_other_reduction(t,j,ac,"level")                    = v35_other_reduction.l(j,ac);
 ov35_secdforest_reduction(t,j,ac,"level")               = v35_secdforest_reduction.l(j,ac);
 ov35_primforest_reduction(t,j,"level")                  = v35_primforest_reduction.l(j);
 ov35_cost_harvest(t,i,"level")                          = v35_cost_harvest.l(i);
 ov35_hvarea_secdforest(t,j,kforestry,ac_sub,"level")    = v35_hvarea_secdforest.l(j,kforestry,ac_sub);
 ov35_hvarea_other(t,j,kforestry,ac_sub,"level")         = v35_hvarea_other.l(j,kforestry,ac_sub);
 ov35_hvarea_primforest(t,j,kforestry,"level")           = v35_hvarea_primforest.l(j,kforestry);
 ov35_prod(t,j,land_natveg,kforestry,"level")            = v35_prod.l(j,land_natveg,kforestry);
 ov_cost_natveg(t,i,"level")                             = vm_cost_natveg.l(i);
 ov_prod_cell_natveg(t,j,kforestry,"level")              = vm_prod_cell_natveg.l(j,kforestry);
 oq35_land_secdforest(t,j,"level")                       = q35_land_secdforest.l(j);
 oq35_land_other(t,j,"level")                            = q35_land_other.l(j);
 oq35_carbon_primforest(t,j,c_pools,"level")             = q35_carbon_primforest.l(j,c_pools);
 oq35_carbon_secdforest(t,j,c_pools,"level")             = q35_carbon_secdforest.l(j,c_pools);
 oq35_carbon_other(t,j,c_pools,"level")                  = q35_carbon_other.l(j,c_pools);
 oq35_landdiff(t,"level")                                = q35_landdiff.l;
 oq35_other_expansion(t,j,ac,"level")                    = q35_other_expansion.l(j,ac);
 oq35_other_reduction(t,j,ac,"level")                    = q35_other_reduction.l(j,ac);
 oq35_secdforest_reduction(t,j,ac,"level")               = q35_secdforest_reduction.l(j,ac);
 oq35_primforest_reduction(t,j,"level")                  = q35_primforest_reduction.l(j);
 oq35_min_forest(t,j,"level")                            = q35_min_forest.l(j);
 oq35_min_other(t,j,"level")                             = q35_min_other.l(j);
 oq35_cost_harvest(t,i,"level")                          = q35_cost_harvest.l(i);
 oq35_prod_other(t,j,"level")                            = q35_prod_other.l(j);
 oq35_hvarea_secdforest(t,j,ac_sub,"level")              = q35_hvarea_secdforest.l(j,ac_sub);
 oq35_hvarea_primforest(t,j,"level")                     = q35_hvarea_primforest.l(j);
 oq35_hvarea_other(t,j,ac_sub,"level")                   = q35_hvarea_other.l(j,ac_sub);
 oq35_secdforest_conversion(t,j,"level")                 = q35_secdforest_conversion.l(j);
 oq35_cost_total(t,i,"level")                            = q35_cost_total.l(i);
 oq35_prod_secdforest(t,j,kforestry,"level")             = q35_prod_secdforest.l(j,kforestry);
 oq35_prod_primforest(t,j,kforestry,"level")             = q35_prod_primforest.l(j,kforestry);
 oq35_prod_cell_natveg(t,j,kforestry,"level")            = q35_prod_cell_natveg.l(j,kforestry);
 ov35_secdforest(t,j,ac,"upper")                         = v35_secdforest.up(j,ac);
 ov35_other(t,j,ac,"upper")                              = v35_other.up(j,ac);
 ov_landdiff_natveg(t,"upper")                           = vm_landdiff_natveg.up;
 ov35_other_expansion(t,j,ac,"upper")                    = v35_other_expansion.up(j,ac);
 ov35_other_reduction(t,j,ac,"upper")                    = v35_other_reduction.up(j,ac);
 ov35_secdforest_reduction(t,j,ac,"upper")               = v35_secdforest_reduction.up(j,ac);
 ov35_primforest_reduction(t,j,"upper")                  = v35_primforest_reduction.up(j);
 ov35_cost_harvest(t,i,"upper")                          = v35_cost_harvest.up(i);
 ov35_hvarea_secdforest(t,j,kforestry,ac_sub,"upper")    = v35_hvarea_secdforest.up(j,kforestry,ac_sub);
 ov35_hvarea_other(t,j,kforestry,ac_sub,"upper")         = v35_hvarea_other.up(j,kforestry,ac_sub);
 ov35_hvarea_primforest(t,j,kforestry,"upper")           = v35_hvarea_primforest.up(j,kforestry);
 ov35_prod(t,j,land_natveg,kforestry,"upper")            = v35_prod.up(j,land_natveg,kforestry);
 ov_cost_natveg(t,i,"upper")                             = vm_cost_natveg.up(i);
 ov_prod_cell_natveg(t,j,kforestry,"upper")              = vm_prod_cell_natveg.up(j,kforestry);
 oq35_land_secdforest(t,j,"upper")                       = q35_land_secdforest.up(j);
 oq35_land_other(t,j,"upper")                            = q35_land_other.up(j);
 oq35_carbon_primforest(t,j,c_pools,"upper")             = q35_carbon_primforest.up(j,c_pools);
 oq35_carbon_secdforest(t,j,c_pools,"upper")             = q35_carbon_secdforest.up(j,c_pools);
 oq35_carbon_other(t,j,c_pools,"upper")                  = q35_carbon_other.up(j,c_pools);
 oq35_landdiff(t,"upper")                                = q35_landdiff.up;
 oq35_other_expansion(t,j,ac,"upper")                    = q35_other_expansion.up(j,ac);
 oq35_other_reduction(t,j,ac,"upper")                    = q35_other_reduction.up(j,ac);
 oq35_secdforest_reduction(t,j,ac,"upper")               = q35_secdforest_reduction.up(j,ac);
 oq35_primforest_reduction(t,j,"upper")                  = q35_primforest_reduction.up(j);
 oq35_min_forest(t,j,"upper")                            = q35_min_forest.up(j);
 oq35_min_other(t,j,"upper")                             = q35_min_other.up(j);
 oq35_cost_harvest(t,i,"upper")                          = q35_cost_harvest.up(i);
 oq35_prod_other(t,j,"upper")                            = q35_prod_other.up(j);
 oq35_hvarea_secdforest(t,j,ac_sub,"upper")              = q35_hvarea_secdforest.up(j,ac_sub);
 oq35_hvarea_primforest(t,j,"upper")                     = q35_hvarea_primforest.up(j);
 oq35_hvarea_other(t,j,ac_sub,"upper")                   = q35_hvarea_other.up(j,ac_sub);
 oq35_secdforest_conversion(t,j,"upper")                 = q35_secdforest_conversion.up(j);
 oq35_cost_total(t,i,"upper")                            = q35_cost_total.up(i);
 oq35_prod_secdforest(t,j,kforestry,"upper")             = q35_prod_secdforest.up(j,kforestry);
 oq35_prod_primforest(t,j,kforestry,"upper")             = q35_prod_primforest.up(j,kforestry);
 oq35_prod_cell_natveg(t,j,kforestry,"upper")            = q35_prod_cell_natveg.up(j,kforestry);
 ov35_secdforest(t,j,ac,"lower")                         = v35_secdforest.lo(j,ac);
 ov35_other(t,j,ac,"lower")                              = v35_other.lo(j,ac);
 ov_landdiff_natveg(t,"lower")                           = vm_landdiff_natveg.lo;
 ov35_other_expansion(t,j,ac,"lower")                    = v35_other_expansion.lo(j,ac);
 ov35_other_reduction(t,j,ac,"lower")                    = v35_other_reduction.lo(j,ac);
 ov35_secdforest_reduction(t,j,ac,"lower")               = v35_secdforest_reduction.lo(j,ac);
 ov35_primforest_reduction(t,j,"lower")                  = v35_primforest_reduction.lo(j);
 ov35_cost_harvest(t,i,"lower")                          = v35_cost_harvest.lo(i);
 ov35_hvarea_secdforest(t,j,kforestry,ac_sub,"lower")    = v35_hvarea_secdforest.lo(j,kforestry,ac_sub);
 ov35_hvarea_other(t,j,kforestry,ac_sub,"lower")         = v35_hvarea_other.lo(j,kforestry,ac_sub);
 ov35_hvarea_primforest(t,j,kforestry,"lower")           = v35_hvarea_primforest.lo(j,kforestry);
 ov35_prod(t,j,land_natveg,kforestry,"lower")            = v35_prod.lo(j,land_natveg,kforestry);
 ov_cost_natveg(t,i,"lower")                             = vm_cost_natveg.lo(i);
 ov_prod_cell_natveg(t,j,kforestry,"lower")              = vm_prod_cell_natveg.lo(j,kforestry);
 oq35_land_secdforest(t,j,"lower")                       = q35_land_secdforest.lo(j);
 oq35_land_other(t,j,"lower")                            = q35_land_other.lo(j);
 oq35_carbon_primforest(t,j,c_pools,"lower")             = q35_carbon_primforest.lo(j,c_pools);
 oq35_carbon_secdforest(t,j,c_pools,"lower")             = q35_carbon_secdforest.lo(j,c_pools);
 oq35_carbon_other(t,j,c_pools,"lower")                  = q35_carbon_other.lo(j,c_pools);
 oq35_landdiff(t,"lower")                                = q35_landdiff.lo;
 oq35_other_expansion(t,j,ac,"lower")                    = q35_other_expansion.lo(j,ac);
 oq35_other_reduction(t,j,ac,"lower")                    = q35_other_reduction.lo(j,ac);
 oq35_secdforest_reduction(t,j,ac,"lower")               = q35_secdforest_reduction.lo(j,ac);
 oq35_primforest_reduction(t,j,"lower")                  = q35_primforest_reduction.lo(j);
 oq35_min_forest(t,j,"lower")                            = q35_min_forest.lo(j);
 oq35_min_other(t,j,"lower")                             = q35_min_other.lo(j);
 oq35_cost_harvest(t,i,"lower")                          = q35_cost_harvest.lo(i);
 oq35_prod_other(t,j,"lower")                            = q35_prod_other.lo(j);
 oq35_hvarea_secdforest(t,j,ac_sub,"lower")              = q35_hvarea_secdforest.lo(j,ac_sub);
 oq35_hvarea_primforest(t,j,"lower")                     = q35_hvarea_primforest.lo(j);
 oq35_hvarea_other(t,j,ac_sub,"lower")                   = q35_hvarea_other.lo(j,ac_sub);
 oq35_secdforest_conversion(t,j,"lower")                 = q35_secdforest_conversion.lo(j);
 oq35_cost_total(t,i,"lower")                            = q35_cost_total.lo(i);
 oq35_prod_secdforest(t,j,kforestry,"lower")             = q35_prod_secdforest.lo(j,kforestry);
 oq35_prod_primforest(t,j,kforestry,"lower")             = q35_prod_primforest.lo(j,kforestry);
 oq35_prod_cell_natveg(t,j,kforestry,"lower")            = q35_prod_cell_natveg.lo(j,kforestry);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

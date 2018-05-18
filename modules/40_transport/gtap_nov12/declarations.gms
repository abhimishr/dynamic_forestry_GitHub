*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

equation
q40_cost_transport(j,k)   					cellular transport costs for k (mio. USD)
;

variables
 vm_cost_transp(j,k)                        transportation costs (mio. USD)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_transp(t,j,k,type)      transportation costs (mio. USD)
 oq40_cost_transport(t,j,k,type) cellular transport costs for k (mio. USD)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

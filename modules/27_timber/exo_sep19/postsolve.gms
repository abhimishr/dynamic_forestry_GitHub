*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 oq27_prod_wood(t,j,"marginal")     = q27_prod_wood.m(j);
 oq27_prod_woodfuel(t,j,"marginal") = q27_prod_woodfuel.m(j);
 oq27_prod_wood(t,j,"level")        = q27_prod_wood.l(j);
 oq27_prod_woodfuel(t,j,"level")    = q27_prod_woodfuel.l(j);
 oq27_prod_wood(t,j,"upper")        = q27_prod_wood.up(j);
 oq27_prod_woodfuel(t,j,"upper")    = q27_prod_woodfuel.up(j);
 oq27_prod_wood(t,j,"lower")        = q27_prod_wood.lo(j);
 oq27_prod_woodfuel(t,j,"lower")    = q27_prod_woodfuel.lo(j);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

*** EOF postsolve.gms ***

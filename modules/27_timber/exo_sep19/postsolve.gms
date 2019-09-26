*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 oq27_prod_timber(t,i,kforestry,"marginal") = q27_prod_timber.m(i,kforestry);
 oq27_prod_timber(t,i,kforestry,"level")    = q27_prod_timber.l(i,kforestry);
 oq27_prod_timber(t,i,kforestry,"upper")    = q27_prod_timber.up(i,kforestry);
 oq27_prod_timber(t,i,kforestry,"lower")    = q27_prod_timber.lo(i,kforestry);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

*** EOF postsolve.gms ***

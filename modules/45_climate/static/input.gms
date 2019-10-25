*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de



table f45_koeppengeiger(j,clcl) Koeppen-Geiger climate classification on the simulation cluster level (1)
$ondelim
$include "./modules/45_climate/static/input/koeppen_geiger.cs3"
$offdelim;

parameter f45_bcef(ac,clcl) BCEF by Koeppen-Geiger classification mapped to age-classes (1)
/
$ondelim
$include "./modules/45_climate/static/input/f45_EMPERICAL_kg_bcef.csv"
$offdelim
/
;

f45_bcef(ac,clcl) = 2;

table fm_climate_class(j,clcl) Koeppen-Geiger climate classification on the simulation cluster level (1)
$ondelim
$include "./modules/45_climate/static/input/koeppen_geiger.cs3"
$offdelim;

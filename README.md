# cml_agmt_proc_snpsht_daily DBT Implementation

This DBT project implements the ETL logic for the `cml_agmt_proc_snpsht_daily` table on Databricks, mapping all 89 columns from the source and lookup tables as described in the Informatica mapping.

## Workflow Overview

- **Pre-Load Step:** Run `job_preprocessing.ksh` (external to DBT).
- **Truncate Target:** Table truncation handled by DBT full-refresh or pre-hook.
- **Main ETL:** DBT model `cml_agmt_proc_snpsht_daily` performs all joins, lookups, and transformations.
- **Post-Load Step:** Run `job_postprocessing.ksh` (external to DBT).

## Source and Lookup Tables

- CML_AGMT (source)
- FINC_SERVS_PRDT
- ROL_PLYR_CAT_REL
- ROL_PLYR_CAT_REL_MBI
- INT_ORG_RLUP_MM_SNPSHT
- POL_DED_PLAN
- INT_ORG_RLUP
- EXTL_ORG
- CONTR_VEH

## Models

- `stg_cml_agmt`
- `stg_finc_servs_prdt`
- `stg_rol_plyr_cat_rel`
- `stg_rol_plyr_cat_rel_mbi`
- `stg_int_org_rlup_mm_snpsht`
- `stg_pol_ded_plan`
- `stg_int_org_rlup`
- `stg_extl_org`
- `stg_contr_veh`
- `int_cml_agmt_proc_snpsht_daily`
- `cml_agmt_proc_snpsht_daily`

## Orchestration

Orchestration is handled externally (e.g., Airflow, Databricks Jobs).

## Error Handling

DBT run logs and error tables (if needed).

## Table-Level Lineage

See `models/cml_agmt_proc_snpsht_daily.sql` and `models/schema.yml` for column-level mapping.

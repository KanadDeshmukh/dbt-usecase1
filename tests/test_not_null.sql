select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where AGMT_ANCHR_ID is null
   or POL_NBR is null
   or POL_EFF_DT is null
   or LOW_LVL_ORG_ID is null
   or MAX_DED_AMT is null
-- Should return zero rows; if not, not-null constraint violated (tests edge cases with missing data)
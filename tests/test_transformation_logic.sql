-- BNDL_CD transformation
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where BNDL_CD not in ('U', 'B')
-- CAPTV_IND transformation
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where CAPTV_IND not in ('Y', 'N')
-- MAX_DED_CD logic
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where (MAX_DED_AMT < 1000 and MAX_DED_CD <> 'LOW')
   or (MAX_DED_AMT >= 1000 and MAX_DED_AMT < 5000 and MAX_DED_CD <> 'MED')
   or (MAX_DED_AMT >= 5000 and MAX_DED_CD <> 'HIGH')
-- UNCLCT_DED_POL_IND logic
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where (v_UNCOLL_DED_POL is null and UNCLCT_DED_POL_IND <> 'N')
   or (v_UNCOLL_DED_POL is not null and UNCLCT_DED_POL_IND <> 'Y')
-- TYP_INS_IND logic
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where (POL_SYM_CD = 'v_CD_VAL' and TYP_INS_IND <> 'F')
   or (POL_SYM_CD <> 'v_CD_VAL' and TYP_INS_IND <> 'P')
-- Should return zero rows for correct transformation; nonzero for mapping errors
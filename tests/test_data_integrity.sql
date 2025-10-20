-- Referential integrity
select t.ORG_ID
from {{ ref('cml_agmt_proc_snpsht_daily') }} t
left join {{ ref('int_org_rlup') }} r on t.ORG_ID = r.ORG_ID
where r.ORG_ID is null
-- Mapping integrity
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where BNDL_CD not in ('U','B')
   or CAPTV_IND not in ('Y','N')
   or MAX_DED_CD not in ('LOW','MED','HIGH')
-- Business rule integrity
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where MAX_DED_AMT < 0
-- Should return zero rows; negative deductible is invalid
-- Negative cases: broken relationships, invalid mappings, out-of-range values
select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where BNDL_CD not in ('U', 'B')
   or CAPTV_IND not in ('Y', 'N')
   or MAX_DED_CD not in ('LOW', 'MED', 'HIGH')
-- Should return zero rows; if not, invalid categorical values present

select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where NEW_USED_PLN_CD not in ('0','1','2')
-- Should return zero rows

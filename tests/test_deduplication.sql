select AGMT_ANCHR_ID, POL_NBR, count(*) as cnt
from {{ ref('cml_agmt_proc_snpsht_daily') }}
group by AGMT_ANCHR_ID, POL_NBR
having cnt > 1
-- Should return zero rows; deduplication logic should remove duplicates
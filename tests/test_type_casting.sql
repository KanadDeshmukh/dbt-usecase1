select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where cast(MAX_DED_AMT as int) is null and MAX_DED_AMT is not null
   or try_cast(POL_EFF_DT as date) is null and POL_EFF_DT is not null
   or try_cast(NEW_USED_PLN_CD as int) is null and NEW_USED_PLN_CD is not null
-- Should return zero rows; type casting must be valid
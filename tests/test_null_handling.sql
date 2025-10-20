select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where ORG_GP_CD = 'null' and ORG_ID is not null
   or MKT_BSKT_GRP_CD = 'null' and ROL_PLYR_ANCHR_ID_EXTL_ORG is not null
   or LOW_LVL_SALE_ORG_ID = '0' and FINC_LOW_LVL_ORG_ID is null
   or NEW_USED_PLN_CD = '0' and VEH_NEW_USED_IND is null
-- Should return expected null/defaulted rows only
-- Negative cases: check that nulls are handled as per logic
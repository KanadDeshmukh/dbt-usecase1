-- ORG_ID must exist in int_org_rlup
select t.ORG_ID
from {{ ref('cml_agmt_proc_snpsht_daily') }} t
left join {{ ref('int_org_rlup') }} r on t.ORG_ID = r.ORG_ID
where r.ORG_ID is null
-- Should return zero rows; if not, broken relationship (negative test)

-- MKT_PRD_SPEC_ID must exist in stg_finc_servs_prdt
select t.MKT_PRD_SPEC_ID
from {{ ref('cml_agmt_proc_snpsht_daily') }} t
left join {{ ref('stg_finc_servs_prdt') }} l on t.MKT_PRD_SPEC_ID = l.PRDT_ID
where l.PRDT_ID is null
-- Should return zero rows

-- ROL_PLYR_ANCHR_ID_INT_ORG must exist in stg_rol_plyr_cat_rel
select t.ROL_PLYR_ANCHR_ID_INT_ORG
from {{ ref('cml_agmt_proc_snpsht_daily') }} t
left join {{ ref('stg_rol_plyr_cat_rel') }} r on t.ROL_PLYR_ANCHR_ID_INT_ORG = r.ROL_PLYR_ANCHR_ID
where r.ROL_PLYR_ANCHR_ID is null
-- Should return zero rows
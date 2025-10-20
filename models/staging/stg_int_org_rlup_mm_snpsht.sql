select
    ORG_ID,
    FINC_LOW_LVL_ORG_ID,
    SBU_SSU_ID
from {{ source('raw', 'INT_ORG_RLUP_MM_SNPSHT') }}
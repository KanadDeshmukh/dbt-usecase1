select
    ORG_ID,
    EXTL_REFR_CD1
from {{ source('raw', 'INT_ORG_RLUP') }}
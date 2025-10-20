select
    ROL_PLYR_ANCHR_ID,
    CAT_CD,
    EXTL_REFR_CD1
from {{ source('raw', 'ROL_PLYR_CAT_REL') }}
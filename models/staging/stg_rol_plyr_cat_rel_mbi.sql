select
    ROL_PLYR_ANCHR_ID,
    CAT_CD_MBI,
    EXTL_REFR_CD_MBI
from {{ source('raw', 'ROL_PLYR_CAT_REL_MBI') }}
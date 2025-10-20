select
    CONTR_ID,
    VEH_NEW_USED_IND,
    VEH_MAKE_MODEL_ID
from {{ source('raw', 'CONTR_VEH') }}
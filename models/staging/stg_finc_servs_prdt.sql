select
    PRDT_ID,
    PRDT_CD,
    PRDT_DESC
from {{ source('raw', 'FINC_SERVS_PRDT') }}
select
    ORG_ID,
    OPERT_CO_CD
from {{ source('raw', 'EXTL_ORG') }}
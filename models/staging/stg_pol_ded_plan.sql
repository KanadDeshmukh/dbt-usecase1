select
    POL_NBR,
    MAX_DED_AMT
from {{ source('raw', 'POL_DED_PLAN') }}
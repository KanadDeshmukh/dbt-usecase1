select count(*) as actual_row_count
from {{ ref('cml_agmt_proc_snpsht_daily') }}

select count(*) as expected_row_count
from {{ ref('cml_agmt_proc_snpsht_daily_seed') }}

-- Compare actual_row_count to expected_row_count; should match. If not, missing/extra rows.
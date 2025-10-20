select *
from {{ ref('cml_agmt_proc_snpsht_daily') }}
where updated_at is not null
-- Should return zero rows; table should be bulk insert-only (full-refresh).
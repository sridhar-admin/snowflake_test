
select *
from {{ ref('emp') }}
where id=1

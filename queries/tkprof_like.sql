select c.call_type "call", count(c.elapsed) "count", sum(c.cpu) "cpu", sum(c.elapsed) "elapsed",
 sum(c.phys_reads) "disk", sum(c.cons_reads) "query", sum(c.cur_reads) "current", sum(c.num_rows) "rows",
 sum(c.misses) "misses"
from call c join timeline_extended t using (lineno)
where t.sqlid='5dqx2k1st1uxa'
group by t.sqlid, c.call_type
order by decode(c.call_type, 'PARSE', 1, 'EXEC', 2, 'FETCH', 3);

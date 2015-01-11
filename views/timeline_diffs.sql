create or replace view timeline_diffs as
select
  t.call_type,
  t.sqlid,
  substr(cs.sql_text,1,30) sql_text,
  t.close_type,
  t.tim,
  t.tim - lag(t.tim) over (order by t.tim) timediff
from timeline_extended t
left join call c on (t.lineno=c.lineno)
join (select distinct sqlid, sql_text from cursor) cs on (t.sqlid=cs.sqlid)
where T.call_type in ('PARSE', 'EXEC', 'FETCH', 'CLOSE')
order by t.tim;

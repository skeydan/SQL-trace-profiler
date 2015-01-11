with elapsed as
 (select t.sqlid, c.call_type, sum(c.elapsed) elapsed, count(c.elapsed) call_count
  from call c join timeline_extended t using (lineno)
  group by rollup(t.sqlid, c.call_type)
 ),
 sqlids as 
  (select sqlid, sql_text, count(1) occurrence_count, min(call_depth) min_call_depth
   from cursor group by sqlid, sql_text
  )
  select elapsed.*, cast(substr(sqlids.sql_text,1,30) as varchar2(30)) sql_text, sqlids.occurrence_count, sqlids.min_call_depth 
  from elapsed join sqlids on (elapsed.sqlid=sqlids.sqlid)
  order by elapsed desc
  fetch next 10 rows only;

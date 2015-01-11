create or replace view timeline_raw as
  select * from (
    select lineno, 'OPEN' call_type, sqlid, crsr, tim, call_depth, null close_type from cursor
    union all 
    select lineno, 'PARSE', null, crsr, tim, call_depth, null from call where call_type='PARSE'
    union all
    select lineno, 'CLOSE', null, crsr, tim, call_depth, type from cursor_close)
  order by lineno;

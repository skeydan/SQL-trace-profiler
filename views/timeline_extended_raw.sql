create or replace view timeline_extended_raw as
 select "LINENO","CALL_TYPE","SQLID","CRSR","TIM","CALL_DEPTH","CLOSE_TYPE" from
  (
   select lineno, 'OPEN' call_type, sqlid, crsr, tim, call_depth, null close_type from cursor
   union all
   select lineno, 'PARSE', null, crsr, tim, call_depth, null from call where call_type='PARSE'
   union all
   select lineno, 'EXEC', null, crsr, tim, call_depth, null from call where call_type='EXEC'
   union all
   select lineno, 'FETCH', null, crsr, tim, call_depth, null from call where call_type='FETCH'
   union all
   select lineno, 'CLOSE', null, crsr, tim, call_depth, type from cursor_close
   union all
   select lineno, 'WAIT', null, crsr, tim, null, null from wait
  )
 order by lineno;

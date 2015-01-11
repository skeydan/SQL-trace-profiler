create or replace view timeline (lineno, call_type, sqlid, crsr,tim, call_depth, close_type) 
 as select
  lineno,
  call_type,
  case when sqlid is not null then sqlid else lag(sqlid) ignore nulls over (partition by crsr order by lineno) end sqlid,
  crsr,
  tim,
  call_depth,
  close_type
 from timeline_raw order by lineno;

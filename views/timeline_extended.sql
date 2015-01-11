create or replace view timeline_extended as
 select
  lineno,
  call_type,
  case when sqlid is not null then sqlid else lag(sqlid) ignore nulls over (partition by crsr order by lineno) end sqlid,
  crsr,
  tim,
  call_depth,
  close_type
 from timeline_extended_raw order by lineno;


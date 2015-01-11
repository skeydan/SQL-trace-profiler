col percent_wait for 99.99
select
 cast(event as varchar2(32)) event,
 cast(wait_class as varchar2(20)) wait_class,
 time_waited_total,
 num_waits,
 round(100 * ratio_to_report(time_waited_total) over (), 2) percent_wait,
 round(avg_wait) avg_wait,
 round(median_wait) median_wait, round(max_wait) max_wait from
  (
   select
    event, wait_class, sum(elapsed) time_waited_total, count(elapsed) num_waits,
    avg(elapsed) avg_wait, median(elapsed) median_wait, max(elapsed) max_wait
    from wait w join v$event_name e on (w.event=e.name)
    where e.wait_class  'Idle'
    group by event, wait_class
    union all
    select 
    call_type, 'CPU', sum(cpu), count(cpu), avg(cpu), median(cpu), max(cpu) from call
    group by call_type
  )
order by time_waited_total desc;

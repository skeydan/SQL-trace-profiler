drop table call;
create table call
  (
    lineno number,
    call_type varchar2(5),
    crsr number,
    cpu number,
    elapsed number,
    phys_reads number,
    cons_reads number,
    cur_reads number,
    misses number,
    num_rows number,
    call_depth number,
    opt_goal number,
    ph_value number,
    tim number
  )
  organization external
  (
    type oracle_loader
    default directory trace_dir
    access parameters
      (
        records delimited by newline
        preprocessor trace_dir:'call.pl'
        logfile trace_dir:'call.log'
        badfile trace_dir:'call.bad'
        fields terminated by ','
        (
          lineno char,
          call_type char,
          crsr char,
          cpu char,
          elapsed char,
          phys_reads char,
          cons_reads char,
          cur_reads char,
          misses char,
          num_rows char,
          call_depth char,
          opt_goal char,
          ph_value char,
          tim char 
        )
    )
    location (trace_dir:'')
  );

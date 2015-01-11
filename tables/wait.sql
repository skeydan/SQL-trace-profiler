drop table wait;
create table wait (
  lineno number,
  crsr number,
  event varchar2(64),
  elapsed number,
  p1name varchar2(64),
  p1value number,
  p2name varchar2(64),
  p2value number,
  p3name varchar2(64),
  p3value number,
  obj number,
  tim number
  )
  organization external
  (
    type oracle_loader
    default directory trace_dir
    access parameters
      (
        records delimited by newline
        preprocessor  trace_dir:'wait.sh'
        logfile trace_dir:'wait.log'
        badfile trace_dir:'wait.bad'
        fields terminated by ',' optionally enclosed by "'"
         (
          lineno char,
          crsr char,
          event char,
          elapsed char,
          p1name char,
          p1value char,
          p2name char,
          p2value char,
          p3name char,
          p3value char,
          obj_ char,
          obj char,
          tim char 
         )
       )
    location ('')
  );  

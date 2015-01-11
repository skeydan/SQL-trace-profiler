drop table cursor_close;
create table cursor_close (
  lineno number,
  crsr number,
  cpu number,
  elapsed number,
  call_depth number,
  type number,
  tim number )
  organization external
  (
    type oracle_loader
    default directory trace_dir
    access parameters
      (
        records delimited by newline
        preprocessor  trace_dir:'cursor_close.sh'
        logfile trace_dir:'cursor_close.log'
        badfile trace_dir:'cursor_close.bad'
        fields terminated by ',' 
         (
           lineno char,
           crsr char,
           cpu char,
           elapsed char,
           call_depth char,
           type char,
           tim char
         )  
       )
    LOCATION ('')
  ); 

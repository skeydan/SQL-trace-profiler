drop table cursor;
create table cursor (
  lineno number,
  crsr number,
  crsr_length number,
  call_depth number,
  parsing_user_id number,
  command_type number,
  parsing_schema_id number,
  tim number,
  hash_value number,
  address varchar2(8),
  sqlid varchar2(13),
  sql_text varchar2(4000)
  )
  organization external
    (
    type oracle_loader
    default directory trace_dir
    access parameters
      (
        records delimited by newline
        preprocessor trace_dir:'cursor.pl'
        logfile trace_dir:'cursor.log'
        badfile trace_dir:'cursor.bad'
        fields terminated by '!' optionally enclosed by "'"
        (
          lineno char,          
          crsr char,
          crsr_length char,
          call_depth char,
          parsing_user_id char,
          command_type char,
          parsing_schema_id char,
          tim char,
          hash_value char,
          address char,
          sqlid char,
          sql_text char(4000)
        )
      )
    location (trace_dir:'')
  );  

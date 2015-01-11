create or replace procedure changeloc (newloc in varchar2)
is
  tablist sys.odcivarchar2list := sys.odcivarchar2list('cursor','cursor_close','call','wait');
begin
  for i in tablist.first .. tablist.last loop
    execute immediate 'alter table ' || tablist(i) || ' location (''' || newloc || ''')';
  end loop;
end;
/

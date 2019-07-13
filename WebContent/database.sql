create table user_registration(
	fname varchar(20),
	lname varchar(20),
	dob date,
	mobno number(10),
	emailid varchar(50) primary key,
	password varchar(10),
	role varchar(50) default 'customer'
);

alter table user_registration add profileimage blob default empty_blob();

drop table bookList;
create table songList(
	songId number(10) primary key,
	songcategory varchar(20) not null,
	songname varchar(20)not null,
	singername varchar(20)not null,
	rating number(10,2)not null,
	song blob
);

CREATE SEQUENCE song_id
  MINVALUE 1000
  START WITH 1001
  INCREMENT BY 1
  ;

  
  SELECT d.status "Status",
  d.tablespace_name "Name",
  TO_CHAR(NVL(a.bytes / 1024 / 1024, 0),'99999990D900') "Size (M)",
  TO_CHAR(NVL(NVL(f.bytes, 0), 0)/1024/1024 ,'99999990D900') "Free (MB)",
  TO_CHAR(NVL((NVL(f.bytes, 0)) / a.bytes * 100, 0), '990D00') "Free %"
 FROM sys.dba_tablespaces d,
  (select tablespace_name, sum(bytes) bytes from dba_data_files group by tablespace_name) a,
  (select tablespace_name, sum(bytes) bytes from dba_free_space group by tablespace_name) f
  WHERE d.tablespace_name = a.tablespace_name(+)
  AND d.tablespace_name = f.tablespace_name(+)
  AND NOT (d.extent_management like 'LOCAL'  AND d.contents like 'TEMPORARY')
 order by "Free %";
  
  
Status    Name                           Size (M)      Free (MB)     Free %
--------- ------------------------------ ------------- ------------- -------
ONLINE    SYSTEM                               600.000         0.000    0.00
ONLINE    SYSAUX                               700.000        41.313    5.90
ONLINE    UNDOTBS1                             380.000       364.250   95.86
ONLINE    USERS                                100.000        97.438   97.44

SQL> select file_name from sys.dba_data_files;

FILE_NAME
-------------------------------------------------------------------------------
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\USERS.DBF
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSAUX.DBF
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\UNDOTBS1.DBF
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF

  
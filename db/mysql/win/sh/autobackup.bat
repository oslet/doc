@echo off

setlocal enabledelayedexpansion 


set mysqldump=D:\\db\\mysql\\mysql-5.6.39-winx64\\bin\mysqldump.exe

rem echo 取日期、时间变量值

set yy=%date:~0,4%

set mm=%date:~5,2%

set dd=%date:~8,2%

if /i %time:~0,2% lss 10 set hh=0%time:~1,1%

if /i %time:~0,2% geq 10 set hh=%time:~0,2%

set mn=%time:~3,2%

set ss=%time:~6,2%

set date=%yy%%mm%%dd%

set time=%hh%%mn%%ss%

set filename=%date%_%time%


%mysqldump% -udbbak -pbakpasswd -h127.0.0.1 --default-character-set=utf8 --master-data=2 --single-transaction --quick -R --events --flush-logs --databases db01 > D:\\db\\mysql_backup\db_%filename%.sql


cd /d d:\db\sh
dir /a d:\db\mysql_backup > mysqlbakdir.txt
go-sendmail.exe -u falconalert@oslet.net -p abcpasswd -h mail.oslet.net -P 25 -f falconalert@oslet.net -t falconalert@oslet.net -s "The mysql backup was successfully" -a "d:\db\sh\mysqlbakdir.txt"

echo backup finished

@echo off

echo YES | schtasks /create /ru system /tn mysql_backup /tr d:\db\sh\autobackup.bat /st 17:00 /sc DAILY /mo 1
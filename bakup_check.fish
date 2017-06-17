function backup_check
	set -l lastbak (cat ~/.backup.log)[-1] or set -l lastbak 0
	set dtime (math (date +%s) - $lastbak)
	echo "last backup was" $dtime "seconds ago"
end

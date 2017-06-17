function bcheck
	if test -e ~/.backup.log
		set lastbak (cat ~/.backup.log)
	end
	if not set -q lastbak
		set lastbak 0
	end
	set dtime (math (date +%s) - $lastbak)
	set dtime (math $dtime / 3600)
	if test $dtime -ge 28800
		echo "last backup was more than 8 hours ago. Do you want to perform one? (y/n)"
		read -n 1 -p '' ans
		if test $ans = y
			echo "Starting Backup"
			~/.bin/backup
		else
			echo (math (date +%s) - 25200) > ~/.backup.log
		end
	end
end

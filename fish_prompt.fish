function fish_prompt
	set green (set_color -o green)
	set blue (set_color -o blue)
	set red (set_color -o red)
	set yellow (set_color -o yellow)	

	set lastbak (math (date +%s) - (cat ~/.backup.log))
	set lastbak (math $lastbak / 3600)
	
	if test $lastbak -ge 8
		set bak_color (set_color -o red)
	else if test $lastbak -ge 4
		set bak_color $yellow
	else
		set bak_color (set_color -o green)
	end

	set bat (prompt_bat)
	if test $bat -ge 70
		set bat_color $green
	else if test $bat -ge 40
		set bat_color $yellow
	else
		set bat_color $red
	end
	
	if test $bat -lt 0
		set bat ''
	else
		set bat $bat'% '
	end

	set row_1 (echo $green\u250C\u2574$bat_color$bat$green$USER'@'(hostname) $bak_color$lastbak'h'(git_status))
	set row_2 (echo $green\u2514\u2192 $blue(short_pwd)/ \u21AA' ')

	echo $row_1\n$row_2
	bcheck
end

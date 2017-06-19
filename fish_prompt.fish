function fish_prompt
  set stat $status
  if test $stat -eq 0
    set stat ''
  else
    set stat $stat' '
  end
	set green (set_color -o green)
	set blue (set_color -o blue)
	set red (set_color -o red)
	set yellow (set_color -o yellow)	

    set tstamp (cat ~/.backup.log)

    if test $tstamp -eq -1
      set lastbak -1
    else
	  set lastbak (math (date +%s) - $tstamp)
	  set lastbak (math $lastbak / 3600)
	end

    if test $lastbak -eq -1
      set lastbak $red\u21AF
	else if test $lastbak -ge 8
		set lastbak $red$lastbak h
	else if test $lastbak -ge 4
		set lastbak $yellow$lastbak h
	else
		set lastbak $green$lastbak h
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

	set row_1 (echo $green\u250C\u2574$bat_color$bat$green$USER'@'(hostname) $lastbak (git_status))
	set row_2 (echo $green\u2514\u2192 $red$stat$blue(short_pwd) $green'$ ')

	echo $row_1\n$row_2
end

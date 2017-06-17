function git_status
	if not git status ^ /dev/null > /dev/null
		set -e output
	else 
		set gstat (git status)[-1]
		set branch (string split ' ' (git status)[1])[3]
#		echo $gstat
		if string match '*clean*' $gstat > /dev/null
			set state ''
			set color (set_color -o green)
		else
			set state \u21AF
			set color (set_color -o red)
		end
		set output $color' ('$branch$state')'(set_color -o normal)
	end
	echo $output
end

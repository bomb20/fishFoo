function git_status
	if not git status ^ /dev/null > /dev/null
		set -e output
	else 
		set gstat (git status)[-1]
	    for line in (git branch)
          if string match -r "^\*" $line > /dev/null
            set branch (string replace '*' '' $line)
            set branch (string trim $branch)
          end
        end
		if string match '*clean*' $gstat > /dev/null
			set state ''
			set color (set_color -o green)
		else
			set state \u21AF
			set color (set_color -o red)
		end
		set output $color (get_lang)\($branch$state\)(set_color -o normal)
	end
	echo $output
end

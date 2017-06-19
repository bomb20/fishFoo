function fish_greeting
	fortune /usr/share/fortune/startrek | cowsay -f tux
	echo (set_color -o blue)(ddate)\n
end

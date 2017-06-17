function netfoo
	if not wget --spider --quiet kernel.org
		sudo systemctl restart NetworkManager
	end
end

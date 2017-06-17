function prompt_bat
	set acpi_out (acpi -b)
	if echo $acpi_out | grep Discharging > /dev/null
		set percentage (string split ',' $acpi_out)[2]
		set percentage (string trim $percentage)' '
		set percentage (string replace '%' ''  $percentage)
		set percentage (string trim $percentage)
	else
		set percentage -1
	end
	echo $percentage
end

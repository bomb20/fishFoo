#!/usr/bin/env fish

function ssh_agent
	if not pgrep -u $USER ssh-agent > /dev/null
		ssh-agent > ~/.ssh-agent-thing
	end
	
	if not set -q SSH_AGENT_PID
		for line in (cat ~/.ssh-agent-thing)[1..2]
			set pair (string split '; ' $line)[1]
			set pair (string split '=' $pair)
			set key $pair[1]
			set value $pair[2]
			set -x $key $value
		end
	end
end

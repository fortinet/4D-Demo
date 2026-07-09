# Dual Hub Packet Duplication - Branches

SD-WAN duplication rules specify SD-WAN service rules to trigger packet duplication. This allows the duplication to occur based on an SD-WAN rule instead of the source, destination, and service parameters in the duplication rule.

This example will duplicate packets "on-demand", meaning only when the condition of the link is not good enough (out of SLA). 

The option sla-match-service is enabled so that only the specified SLA for the selected service-id controls when the duplicate packets are sent.

Packet duplication is appled to service 1. Below is the relevant SD-WAN service definition:

config system sdwan
	config service
		edit 1
			set name "Critical_Video"
			set mode priority
			set src "Branch-LAN"
			set internet-service enable
			set internet-service-app-ctrl 37065 31077 16354
			set health-check "Prefer_Passive"
			set priority-members 1 2
			set passive-measurement enable
		next
	end
end
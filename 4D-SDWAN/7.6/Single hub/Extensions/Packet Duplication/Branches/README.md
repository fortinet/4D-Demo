# Single Hub Packet Duplication - Branches

SD-WAN duplication rules specify SD-WAN service rules to trigger packet duplication. This allows the duplication to occur based on an SD-WAN rule instead of the source, destination, and service parameters in the duplication rule.

This example will duplicate packets "on-demand", meaning only when the condition of the link is not good enough (out of SLA). 

The option sla-match-service is enabled so that only the specified SLA for the selected service-id controls when the duplicate packets are sent.

Packet duplication is appled to service 3. Below is the relevant SD-WAN service definition:

config system sdwan
	config service
		edit 3
            set name "Corporate_Traffic"
            set mode sla
            set dst "Datacenter-LAN" "Branch-LAN"
            set src "Branch-LAN"
            config sla
                edit "HUB"
                    set id 1
                next
            end
            set priority-zone "HUB1"
        next
	end
end
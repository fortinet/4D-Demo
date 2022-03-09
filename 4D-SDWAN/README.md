# SD-WAN demonstration configurations (4-D)
------------
4-D Demo configurations are a collection of configurations which complement the preceeding 3 Ds: Define, Design, and Deploy. These configrations are some samples of SD-WAN implementations for:

- Branches with no central hub or Datacenter
- Single hub/DC and branches
- Dual hub/DC and branches

The branch with no central hub is a single configuration for one site and does not require any other configuration files, nor do any other files build upon this configuration.

Single Hub and Dual hub both have a base configuration for the Hub(s) and Branches. These config files listed below are the base configuration which more advanced features (extensions) may be added to.

## Single Hub:
- single_hub_HUB1_SD-WAN_Overlay.txt
- single_hub_Branch1_SD-WAN_Overlay.txt
- single_hub_Branch2_SD-WAN_Overlay.txt

## Dual Hub
- dual_hub_HUB1_SD-WAN_Overlay.txt
- dual_hub_HUB2_SD-WAN_Overlay.txt
- dual_hub_Branch1_SD-WAN_and_Overlay.txt
- dual_hub_Branch2_SD-WAN_and_Overlay.txt

The extensions are designed to be added if necessary and may be combined with each other. Each addon will involve a configuration file for both the hub(s) and branches. All configuration files for a given extension must be added for the feature to work.

Changes made to the base configuration may affect an extension's ability to be integrated. Changes to things such as policy ID numbers, SD-WAN rule numbers, BGP peer names, will need to be reflected in the extension configuration files as well.

# Disclaimers
------------
These configurations are for SD-WAN and related aspects, such as policies, address objects, BGP, IPsec. This configuration alone does not provide sufficient security for a given location. Please review [FortiGate Best Practices](https://docs.fortinet.com/document/fortigate/7.0.0/best-practices/587898/getting-started) and [FortiGate Admin Guide](https://docs.fortinet.com/document/fortigate/7.0.5/administration-guide/954635/getting-started) to compliment this deployment.

An IP address scheme for HUB LAN, Branch LAN and IPSec is chosen which reflects the principles discussed in the complementing 4D documents; design and define. Careful consideration should be taken when changing the scheme.

The WAN IP addresses are not discussed out side of the IPsec configuration on the branches (remote gateway).

Underlay routing is assumed to be present. No consideration is given for hub or branches internet reachability. It is assumed that any given FortiGate has full internet connectivity and public IP addresses. Furthermore, the two WAN links are assumed to be functioning in an equal cost multi path configuration where both gateways are present in the routing table.

# Table of Contents
------------
Below illustrates the directory structure.

    Root directory/
        Standalone SD-WAN/
            Branch_only_underlay.drawio
			Branch_only_underlay.png
			Readme.md
			standalone_Branch_SD-WAN.txt
			
        Single Hub/
			SD_overlay_bgp.drawio
			SD_overlay_bgp.png
			SD_overlay_ipsec.drawio
			SD_overlay_ipsec.png
			SD_underlay.drawio
			SD_underlay.png
            Hub/
                single_hub_HUB1_SD-WAN_Overlay.txt
				readme.md
			Branches/
                single_hub_Branch1_SD-WAN_Overlay.txt
                single_hub_Branch2_SD-WAN_Overlay.txt
				readme.md
            Extensions/
                ADVPN/
                    Hub/
                        single_hub_HUB1_ADVPN.txt
						readme.md
                    Branches/
                        single_hub_Branch1_ADVPN.txt
                        single_hub_Branch2_ADVPN.txt
						readme.md
                SaaS Remote Internet Breakout/
                    Hub/
                        single_hub_HUB1_remote-internet-breakout.txt
						readme.md
                    Branches/
                        single_hub_Branch1_remote-internet-breakout.txt
                        single_hub_Branch2_remote-internet-breakout.txt
						readme.md
				BGP Neighbor Config for Symmetric Route Steering from Datacenter/
                    Hub/
                        single_hub_HUB1_bgp-route-steering.txt
						readme.md
                    Branches/
                        single_hub_Branch1_bgp-route-steering.txt
                        single_hub_Branch2_bgp-route-steering.txt
						readme.md
                Adaptive FEC/
                    Hub/
                        single_hub_HUB1_adaptive-fec.txt
						readme.md
                    Branches/
                        single_hub_Branch1_adaptive-fec.txt
                        single_hub_Branch2_adaptive-fec.txt
						readme.md
        Dual Hub/
			DH_SD_overlay_bgp.drawio
			DH_SD_overlay_bgp.png
			DH_SD_overlay_ipsec.drawio
			DH_SD_overlay_ipsec.png
			DH_SD_underlay.drawio
			DH_SD_underlay.png
            Hub/
                dual_hub_HUB1_SD-WAN_Overlay.txt
                dual_hub_HUB2_SD-WAN_Overlay.txt
				readme.md
            Branches/
                dual_hub_Branch1_SD-WAN_Overlay.txt
                dual_hub_Branch2_SD-WAN_Overlay.txt
				readme.md
            Extensions/
                ADVPN/
				    Hub/
                        dual_hub_HUB1_ADVPN.txt
                        dual_hub_HUB2_ADVPN.txt
						readme.md
                    Branches/
                        dual_hub_Branch1_ADVPN.txt
                        dual_hub_Branch2_ADVPN.txt 
						readme.md
                SaaS Remote Internet Breakout/
                    Hub/
                        dual_hub_HUB1_remote-internet-breakout.txt
                        dual_hub_HUB2_remote-internet-breakout.txt
						readme.md
                    Branches/
                        dual_hub_Branch1_remote-internet-breakout.txt
                        dual_hub_Branch2_remote-internet-breakout.txt
						readme.md
                BGP Neighbor Config for Symmetric Route Steering from Datacenter/
                    Hub/
                        dual_hub_HUB1_bgp-route-steering.txt
                        dual_hub_HUB2_bgp-route-steering.txt
						readme.md
                    Branches/
                        dual_hub_Branch1_bgp-route-steering.txt
                        dual_hub_Branch2_bgp-route-steering.txt
						readme.md
                Adaptive FEC/
                    Hub/
                        dual_hub_HUB1_adaptive-fec.txt
                        dual_hub_HUB2_adaptive-fec.txt
						readme.md
                    Branches/
                        dual_hub_Branch1_adaptive-fec.txt
                        dual_hub_Branch2_adaptive-fec.txt
						readme.md
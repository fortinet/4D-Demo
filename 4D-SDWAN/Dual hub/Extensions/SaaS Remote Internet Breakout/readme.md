# Remote Internet Breakout General

In this scenario, branch traffic needs to route a SaaS application (in this case, RingCentral VoIP) through the HUB. The config can be modified to include any traffic type or application in your environment. 

Example: RingCentral (VoIP) may need local internet breakout at the branch. However, a private MPLS circuit is also available with internet accessible via the HUB. In this config, we route RingCentral traffic via the overlay to the HUB for remote internet break out. 

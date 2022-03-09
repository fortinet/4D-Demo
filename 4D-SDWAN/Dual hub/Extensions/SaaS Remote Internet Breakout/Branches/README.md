# SD-WAN dual hub Saas Remote Internet Breakout - Branches

This configuration is to enable SaaS Remote Internet Breakout on the branches. This allows branches to access cloud applications through the Hub.

The Spoke will route only Ringcentral VoIP traffic through hub1 and hub2 overlays. 

The SDWAN rule is set to 'set gateway enable' to override the route table and send traffic that matches this application through hub1 and hub2.

# Assumptions

The following settings are specific to the demo and should be changed to fit your environment as necessary.

1) The application 'Ring Central' is selected to illustrate this feature. You should select applications specific to your business.

# Changes between branches

None.

# The default configuration changes the admin https port from 443 to 9443. You may update the host to reflect the port change using x.x.x.x:9443
host = "x.x.x.x:9443"
token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

#Global settings
hostname = "FW_FLR1"
admin_https_port = "9443"      # If you change this setting, ensure that the port in the host IP:port setting is updated
admin_ssh_port = "9922"

# RADIUS server settings
radserver = "x.x.x.x"
radpass = "<radius password>"
radname = "RADIUS" # this name is how the radius server appears on the FortiGate.

# admin vars
trusthost = "x.x.x.x/24"
fortitoken = "FTKMOBxxxxxxxxxx"		# replace with 1 of 2 free FortiToken S/Ns from User & Authentication > FortiTokens
adminemail = "<admin email>"
adminpassword = "<admin password>"     # Comment out if you want to be prompted for password during terraform apply

# Interface mappings
WAN_INT = "port1"
LAN_INT = "port2"
MGMT_INT = "port3"

# Interfaces
LAN_addr = "x.x.x.x 255.255.255.0"
MGMT_addr = "x.x.x.x 255.255.255.0"
vlan_netmask = "255.255.255.0"

## VLAN-internal (1)
vlan1_default_gw = "x.x.x.x"
vlan1_start = "x.x.x.x"
vlan1_end = "x.x.x.x"
vlan1_int = "port2"
vlan1_subnet = "x.x.x.x 255.255.255.0"

## Addresses for VLAN20 - VLAN 70 typically do not require editing unless there is an IP conflict.
## VLAN20
VLAN20_IP = "192.168.20.254 255.255.255.0"
VLAN20_default_gw = "192.168.20.254"
VLAN20_start = "192.168.20.10"
VLAN20_end = "192.168.20.253"
VLAN20_int = "VLAN20" #This matches the interface on the Fortigate
VLAN20_name = "VLAN20" #This could be "IT" or "Sales"
VLAN20_subnet = "192.168.20.0 255.255.255.0"
VLAN20_usergroup = "IT"
VLAN20_name_net = "VLAN20_net"

## VLAN21
VLAN21_IP = "192.168.21.254 255.255.255.0" #interface IP
VLAN21_default_gw = "192.168.21.254"
VLAN21_start = "192.168.21.10"
VLAN21_end = "192.168.21.253"
VLAN21_int = "VLAN21"
VLAN21_name = "VLAN21"
VLAN21_subnet = "192.168.21.0 255.255.255.0"
VLAN21_name_net = "VLAN21_net"
VLAN21_SRV_IP = "192.168.21.1"
VLAN21_SRV_IP_Subnet = "192.168.21.1 255.255.255.255"
VLAN21_SRV_port1 = "8765"
VLAN21_SRV_port2 = "6543"
VLAN21_SRV_name1 = "IT_SRV1"
VLAN21_SRV_name2 = "IT_SRV2"
VLAN21_SRV_GRP_NAME = "IT_Services"

## VLAN30
VLAN30_IP = "192.168.30.254 255.255.255.0"
VLAN30_default_gw = "192.168.30.254"
VLAN30_start = "192.168.30.10"
VLAN30_end = "192.168.30.253"
VLAN30_int = "VLAN30"
VLAN30_name = "VLAN30"
VLAN30_name_net = "VLAN30_net"
VLAN30_subnet = "192.168.30.0 255.255.255.0"
VLAN30_usergroup = "Engineering"

## VLAN31
VLAN31_IP = "192.168.31.254 255.255.255.0"
VLAN31_default_gw = "192.168.31.254"
VLAN31_start = "192.168.31.10"
VLAN31_end = "192.168.31.253"
VLAN31_int = "VLAN31"
VLAN31_name = "VLAN31"
VLAN31_name_net = "VLAN31_net"
VLAN31_subnet = "192.168.31.0 255.255.255.0"
VLAN31_SRV_IP = "192.168.31.1"
VLAN31_SRV_IP_Subnet = "192.168.31.1 255.255.255.255"
VLAN31_SRV_port1 = "5678"
VLAN31_SRV_port2 = "4678"
VLAN31_SRV_name1 = "ENG_SRV1"
VLAN31_SRV_name2 = "ENG_SRV2"
VLAN31_SRV_GRP_NAME = "ENG_Services"

## VLAN40
VLAN40_IP = "192.168.40.254 255.255.255.0"
VLAN40_default_gw = "192.168.40.254"
VLAN40_start = "192.168.40.10"
VLAN40_end = "192.168.40.253"
VLAN40_int = "VLAN40"
VLAN40_name = "VLAN40"
VLAN40_name_net = "VLAN40_net"
VLAN40_subnet = "192.168.40.0 255.255.255.0"

## VLAN50
VLAN50_IP = "192.168.50.254 255.255.255.0"
VLAN50_default_gw = "192.168.50.254"
VLAN50_start = "192.168.50.10"
VLAN50_end = "192.168.50.253"
VLAN50_int = "VLAN50"
VLAN50_name = "VLAN50"
VLAN50_name_net = "VLAN50_net"
VLAN50_subnet = "192.168.50.0 255.255.255.0"
VLAN50_SRV_name = "CORP_SRV"
VLAN50_SRV_IP_Subnet = "192.168.50.1 255.255.255.255"

## VLAN60
VLAN60_IP = "192.168.60.254 255.255.255.0"
VLAN60_default_gw = "192.168.60.254"
VLAN60_start = "192.168.60.10"
VLAN60_end = "192.168.60.253"
VLAN60_int = "VLAN60"
VLAN60_name = "VLAN60"
VLAN60_name_net = "VLAN60_net"
VLAN60_subnet = "192.168.60.0 255.255.255.0"

## VLAN70
VLAN70_IP = "192.168.70.254 255.255.255.0"
VLAN70_default_gw = "192.168.70.254"
VLAN70_start = "192.168.70.10"
VLAN70_end = "192.168.70.253"
VLAN70_int = "VLAN70"
VLAN70_name = "VLAN70"
VLAN70_name_net = "VLAN70_net"
VLAN70_subnet = "192.168.70.0 255.255.255.0"
VLAN70_usergroup = "Staff"

# wireless
wtp_profile = "Corp_Wireless"
ap_type = "<AP Type>"         # select AP type from list below. Use value in left column
ap_SN = "xxxxxxxxxxxxxxxx"
wtp_profile-legacy = "FAPS321C-default"    # select only if FortiAP is a legacy device.
SSID1 = "IT_WiFi"
SSID2 = "Staff_WiFi"
SSID3 = "EngineeringWiFi"

/* AP Types
AP-11N    Default 11n AP.
220B      FAP220B/221B.
210B      FAP210B.
222B      FAP222B.
112B      FAP112B.
320B      FAP320B.
11C       FAP11C.
14C       FAP14C.
223B      FAP223B.
28C       FAP28C.
320C      FAP320C.
221C      FAP221C.
25D       FAP25D.
222C      FAP222C.
224D      FAP224D.
214B      FK214B.
21D       FAP21D.
24D       FAP24D.
112D      FAP112D.
223C      FAP223C.
321C      FAP321C.
S321C     FAPS321C.
S322C     FAPS322C.
S323C     FAPS323C.
S311C     FAPS311C.
S313C     FAPS313C.
S321CR    FAPS321CR.
S322CR    FAPS322CR.
S323CR    FAPS323CR.
S421E     FAPS421E.
S422E     FAPS422E.
S423E     FAPS423E.
421E      FAP421E.
423E      FAP423E.
221E      FAP221E.
222E      FAP222E.
223E      FAP223E.
224E      FAP224E.
231E      FAP231E.
S221E     FAPS221E.
S223E     FAPS223E.
321E      FAP321E.
431F      FAP431F.
431FL     FAP431FL.
432F      FAP432F.
432FR     FAP432FR.
433F      FAP433F.
433FL     FAP433FL.
231F      FAP231F.
231FL     FAP231FL.
234F      FAP234F.
23JF      FAP23JF.
831F      FAP831F.
231G      FAP231G.
233G      FAP233G.
431G      FAP431G.
433G      FAP433G.
U421E     FAPU421EV.
U422EV    FAPU422EV.
U423E     FAPU423EV.
U221EV    FAPU221EV.
U223EV    FAPU223EV.
U24JEV    FAPU24JEV.
U321EV    FAPU321EV.
U323EV    FAPU323EV.
U431F     FAPU431F.
U433F     FAPU433F.
U231F     FAPU231F.
U234F     FAPU234F.
U432F     FAPU432F.
*/

# FortiGate Cloud logging
service_account = "<account email>"
service_region = "automatic"             # Region can be automatic, usa, or eu
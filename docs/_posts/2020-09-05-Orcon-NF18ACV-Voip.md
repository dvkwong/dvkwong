---
tags:
  - NF18ACV
---

These are instructions for using a USG with an ISP's existing router with VOIP. 

1. Configure the USG to a differing ip and subnet eg 10.0.0.1 - 10.0.0.0/24 than your ISP routers usually 192.168.0.1. [More info](https://community.ui.com/questions/How-to-add-a-usg-behind-an-isps-modem-without-bridging/3e28876f-1ef6-44be-b9f0-e26f6a32854d)
2. Set USG WAN to DHCP and clear the VLAN, plug into NF18ACV LAN port
3. On NF18ACV disable WIFI, keep DHCP on.
4. Done

Notes:
* You can even access the NF18ACV configuration page from the other subnet.
* With USG as primary router the NF18ACV Voip was constantly dropping and only 1 way communication.
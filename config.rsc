# 1. Create new firewall nat rule
/ip firewall nat add chain=srcnat action=masquerade comment="Mostech_Auto"

# 2. Allow remote request DNS
:if ([/ip dns get allow-remote-requests] = false) do={ /ip dns set allow-remote-requests=yes }

# 3. Start service
/interface pptp-server server set enabled=yes
/interface sstp-server server set enabled=yes
/interface l2tp-server server set enabled=yes

# 4. Create ppp profile
/ppp profile add name=pptp local-address=11.10.11.1 rate-limit=3M/3M comment="Mostech_Auto"

# 5. Create sstp profile
/ppp profile add name=sstp local-address=11.10.12.1 rate-limit=3M/3M comment="Mostech_Auto"

# 6. Create l2tp profile
/ppp profile add name=l2tp local-address=11.10.13.1 rate-limit=3M/3M comment="Mostech_Auto"

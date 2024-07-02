# 1. Membuat NAT rule baru
/ip firewall nat add chain=srcnat action=masquerade comment="Mostech_Auto"

# 2. Melakukan pengecekan pada allow remote request di DNS settings
:if ([/ip dns get allow-remote-requests] = false) do={ /ip dns set allow-remote-requests=yes }

# 3. Mengaktifkan PPTP, SSTP, dan L2TP server
/interface pptp-server server set enabled=yes
/interface sstp-server server set enabled=yes
/interface l2tp-server server set enabled=yes

# 4. Membuat PPP profile baru untuk PPTP
/ppp profile add name=pptp local-address=11.10.11.1 rate-limit=3M/3M comment="Mostech_Auto"

# 5. Membuat PPP profile baru untuk SSTP
/ppp profile add name=sstp local-address=11.10.12.1 rate-limit=3M/3M comment="Mostech_Auto"

# 6. Membuat PPP profile baru untuk L2TP
/ppp profile add name=l2tp local-address=11.10.13.1 rate-limit=3M/3M comment="Mostech_Auto"

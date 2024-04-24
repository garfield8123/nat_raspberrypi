#wlan0 = external
#eth0 = internal
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE --random
sudo iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

#sudo ifconfig eth0 192.168.0.1 netmask 255.255.255.0
cat /etc/dhcpcd.conf
#https://serverfault.com/questions/564866/how-to-set-up-linux-server-as-a-router-with-nat
#https://learn.sparkfun.com/tutorials/setting-up-a-raspberry-pi-3-as-an-access-point/enable-packet-forwarding

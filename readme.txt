 add new network interface
 http://lifeslider.blogspot.com/2012/07/virtualbox.html
 in virtual box each machine should has two adapters:
  - NAT - to get internet access
  - Host-only adapter - to let the host machine connect to vm
  In this case vm will not be sccessible from outside
  
  add to  /etc/network/interfaces new interface with static IP:
# The host-only network interface
auto enp0s8
iface enp0s8 inet static
address 192.168.56.101
netmask 255.255.255.0
network 192.168.56.0
broadcast 192.168.56.255

-------------------------------------------------------------

Make the PyCharm able to connect to interpreter via docker tcp
The Docker systemd unit can be customized by overriding the unit that ships with the default CoreOS settings. Common use-cases for doing this are covered below. Enable the remote API on a new socket
Create a file called /etc/systemd/system/docker-tcp.socket to make Docker available on a TCP socket on port 2375 and put the following to it:
[Unit]
Description=Docker Socket for the API
[Socket]
ListenStream=2375
BindIPv6Only=both
Service=docker.service
[Install]
WantedBy=sockets.target

Then enable this new socket:
systemctl enable docker-tcp.socket
systemctl stop docker
systemctl start docker-tcp.socket
systemctl start docker

Test that it’s working:
docker -H tcp://127.0.0.1:2375 ps

---------------------------------------------------------------
Connect to the host machine from a VirtualBox guest OS?
this commang will give the IP in gateway column:
netstat -rn
---------------------------------------------------------------
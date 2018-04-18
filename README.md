H1. Minimal docker image for OpenVPN startup

H2. Build docker image
docker build .

H2. Start container on 0.0.0.0:1194
docker run -t -i -d --privileged -p 1194:1194/udp --name openvpn openvpn

H2. Get OpenVPN client config file
docker cp CONTAINER_ID:/etc/openvpn/client.conf ./

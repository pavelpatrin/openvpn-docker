# Minimal docker image for OpenVPN startup

## Prerequirements
GIT, Docker

## Clone this repository
```sh
root@host# git clone https://github.com/pavelpatrin/openvpn-docker-minimal.git
root@host# cd openvpn-docker-minimal
```

## Build docker image for your server
```sh
root@host# docker build . -t openvpn --build-arg server=yourserver.com
```

## Start container on 0.0.0.0:1194
```sh
root@host# docker run -t -i -d --privileged -p 1194:1194/udp --name openvpn openvpn
```

## Get OpenVPN client config file
```sh
root@host# docker cp CONTAINER_ID:/etc/openvpn/client.conf ./
```

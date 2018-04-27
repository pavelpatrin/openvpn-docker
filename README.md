# Minimal docker image for OpenVPN startup

## Prerequirements
Linux, git, Docker

## Clone this repository
```sh
root@host# git clone https://github.com/pavelpatrin/openvpn-docker.git
root@host# cd openvpn-docker-minimal
```

## Build docker image for your server
```sh
root@host# docker build . -t openvpn \
    --build-arg server_host=yourserver.com \
    --build-arg server_port=1194 \
    --build-arg server_proto=udp \
    --build-arg server_net=10.100.200.0 \
    --build-arg client_name=client
```

## Start container on 0.0.0.0:1194
```sh
root@host# docker run -t -i -d --privileged --publish 1194:1194/udp --name openvpn openvpn
```

## Get OpenVPN client config file
```sh
root@host# docker cp openvpn:/etc/openvpn/client.conf ./
```

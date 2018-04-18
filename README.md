# Minimal docker image for OpenVPN startup

## Build docker image
```sh
docker build .
```

## Start container on 0.0.0.0:1194
```sh
docker run -t -i -d --privileged -p 1194:1194/udp --name openvpn openvpn
```

## Get OpenVPN client config file
```sh
docker cp CONTAINER_ID:/etc/openvpn/client.conf ./
```

# Minimal docker image for OpenVPN startup

## Build docker image for your server
```sh
docker build . -t openvpn --build-arg hostname=yourserver.com
```

## Start container on 0.0.0.0:1194
```sh
docker run -t -i -d --privileged -p 1194:1194/udp --name openvpn openvpn
```

## Get OpenVPN client config file
```sh
docker cp CONTAINER_ID:/etc/openvpn/client.conf ./
```

# nut-server
nut server docker image for serving switch nsp and xci to tinfoil on local network

## Quick Start

Launch the nut-server docker container with the following command:

``` 
docker run -d \
    --name=nut-server \
    -p 9000:9000 \
    -v $GAMES:/games:rw \
    -e ID=GUEST \
    -e PASSWORD=GUEST \
    ramdockerapp/nut-server
```

Where:

- $GAMES : Path to switch NSP and XCI library on host.

## BUGS

- You need to call scan API after first launch of the container in order to scan your games folder. ex : 
```
    wget -q --spider --user guest --password guest http://127.0.0.1:9000/api/scan 
```

- You can also just call the API from a web browser. Ex on Google Chrome : http://<docker_host_ip>:9000/api/scan

## TODO

- Add env variables for port 
- Add scheduled scan for games library (/api/scan) 
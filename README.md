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


## TODO

- Add env variables for credentials 
- Add env variables for port 
- Add scheduled scan for games library (/api/scan) 
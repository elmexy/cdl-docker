
# Unofficial CyberDropDownloader Docker Image

## Before proceeding
This is ENTIRELY unofficial. Do NOT ask for support from the dev(s) of cyberdrop-dl-patched.


### GHCR / Dockerhub Repos (amd64/arm64)
```
docker pull ghcr.io/elmexy/cdl-docker:latest
```

```
docker pull elmexy/cdl-docker:latest
```

## Docker run command

```
docker run -it \
  --name cdl-docker \
  -v $(pwd)/AppData:/cyberdrop-dl/AppData \
  -v $(pwd)/Downloads:/cyberdrop-dl/Downloads \
  ne0lith/cdl-docker:latest \
  cyberdrop-dl
```

## Docker-Compose configuration

```yaml
services:
  cdl-docker:
    container_name: cdl-docker
    image: ghcr.io/elmexy/cdl-docker:lastest
    #user: ${FIXUID:-0}:${FIXGID:-0}
    volumes:
      - ./AppData:/cyberdrop-dl/AppData
      - ./Downloads:/cyberdrop-dl/Downloads
    environment:
      - TZ=America/Vancouver
      - SCHEDULE=ON
      - TIME=15 */6 * * *
      - SETUP=no
    #restart: no
    stdin_open: true
    tty: true
```



## Running as a different user

In situations where you need the daemon to be run as a different user, specify a user/group in your `docker run` or `docker-compose.yml` file to run as a different user. [fixuid](https://github.com/boxboat/fixuid) will handle it at runtime.

- In `docker run` commands, you can specify the user like this: `--user 1000:1000`
- In `docker-compose.yml` files, you can specify the user like this: `user: ${FIXUID:-1000}:${FIXGID:-1000}`

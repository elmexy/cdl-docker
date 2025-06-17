
# Unofficial CyberDropDownloader Docker Image

## Before proceeding
This is ENTIRELY unofficial. Do NOT ask for support from the dev(s) of cyberdrop-dl-patched. With some added features. 
  
  ADDED
   - nano. So you can edit files
   - cron. For scheduling

 Removed
  - Web TTY Gotty

### GHCR Repos (amd64)
```
docker pull ghcr.io/elmexy/cdl-docker:latest
```


## Docker run command

```
docker run -it \
  --name cdl-docker \
  -v $(pwd)/AppData:/cyberdrop-dl/AppData \
  -v $(pwd)/Downloads:/cyberdrop-dl/Downloads \
  ghcr.io/elmexy/cdl-docker:latest \
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
      - TZ=Etc/UTC
      - SCHEDULE=ON
      - TIME=15 */6 * * *
      - SETUP=no
    #restart: no
    stdin_open: true
    tty: true
```
| Parameter | Function | Defult |
| :----: | --- | ---- |
| `TZ` | specify a timezone to use, see this [list](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List). | Etc/UTC |
| `SCHEDULE` | Used if you want to run a certan time. | OFF |
| `TIME` | Set crontab schedule | 0 0 * * * (if SCHEDULE ON) |
| `SETUP` | Runs CyberDropDownloader on start of contaner. Used for first time setup | NO |




## Running as a different user

In situations where you need the daemon to be run as a different user, specify a user/group in your `docker run` or `docker-compose.yml` file to run as a different user. [fixuid](https://github.com/boxboat/fixuid) will handle it at runtime.

- In `docker run` commands, you can specify the user like this: `--user 1000:1000`
- In `docker-compose.yml` files, you can specify the user like this: `user: ${FIXUID:-1000}:${FIXGID:-1000}`

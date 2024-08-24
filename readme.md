# Linux Mint Playwright

Somehow I got playwright to work on linux mint. This repo is trying to reproduce that.

```bash

docker build -t linuxmint-playwright .

docker run --rm -it -v "$(pwd)/docker-store:/usr/src/app/docker-store" linuxmint-playwright
```

> I believe it was the following packages that were missing. and that install-deps does not install them.

```bash
libx264-dev 
libicu-dev 
```
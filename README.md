sharelatex-full
==============

A [sharelatex](https://hub.docker.com/r/sharelatex/sharelatex) docker image with TeX Live's full installation scheme installed (that is, most of the TeX packages you'd ever need)

## Versions

Tags of this image on Docker Hub are precicely the same as the `sharelatex/sharelatex` tag that the image is based on.

## Usage

Here's an example `docker-compose.yml` file to use this image:

```
version: '2'
services:
    sharelatex:
        restart: always
        image: cemulate/sharelatex-full:v1.2.1
        depends_on:
            - mongo
            - redis
        privileged: true
        ports:
            - 5000:80
        links:
            - mongo
            - redis
        volumes:
            - ./sharelatex_data:/var/lib/sharelatex
            - ./sharelatex_files:/tmp/files
        environment:
            SHARELATEX_MONGO_URL: mongodb://mongo/sharelatex
            SHARELATEX_REDIS_HOST: redis
            SHARELATEX_APP_NAME: Our ShareLaTeX

    mongo:
        restart: always
        image: mongo
        expose:
            - 27017
        volumes:
            - ./mongo_data:/data/db
            - ./mongo_configdb:/data/configdb

    redis:
        restart: always
        image: redis
        expose:
            - 6379
        volumes:
            - ./redis_data:/data
```

Note the volumes will need to be created in the same directory before hand.
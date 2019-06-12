# Docker Startpage

> Server Startpage designed for hub.pilgrim.me.uk with automatic docker api based link generation

## Docker Setup
The environment variable `DOCKER_PATH` must be set to the location of the http docker api.
Containers running will automatically get added to the listing provided they do not have the `startpage.hidden=true` label. Their urls will be set based upon the `traefik.frontend.rule` label, as configured with the Host paramater.

## Development Setup

``` bash
# install dependencies
$ npm install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm start

# generate static project
$ npm run generate
```

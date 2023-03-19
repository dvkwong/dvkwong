---
title: Docker container for Jekyll 
categories:
  - posts
tags:
  - Docker
  - Containers
  - Jekyll
---

[Jekyll](https://jekyllrb.com/) is a static website generator that converts markdown to html. 
Jekyll is developed using Ruby and can be challenging to install required components.

## Welcome [Docker](https://www.docker.com/)! 

Docker is a cross platform tool that allows applications to be run in an
isolated environment called containers similar to a VM. Containers are much smaller and less
cpu and memory intensive than VM's.

The official [Jekyll container](https://github.com/jekyll/docker) comes setup with 
everything required to run Jekyll.

## Requirements

1. Install [Docker](https://www.docker.com/)
1. A Jekyll website or clone the [minimal mistakes](https://github.com/mmistakes/minimal-mistakes) or 
[this](https://github.com/dvkwong/devint) Jekyll sites.

## Running the Jekyll Container

1. Open a powershell or terminal window
1. Navigate to your Jekyll website directory
1. Run command for Windows powershell
```cs
docker run --rm --volume="$PWD":/srv/jekyll -it -p 4000:4000 -e JEKYLL_ENV=dev `
jekyll/jekyll:pages jekyll s --config _config.yml,_config.dev.yml --force_polling
```
1. Run command for OSX/Linux terminal
```cs
docker run --rm --volume=$(pwd):/srv/jekyll -it -p 4000:4000 `
jekyll/jekyll jekyll s --config _config.yml,_config.dev.yml
```
1. Wait for gem files and Jekyll to build the website
1. Open your browser to [http://localhost:4000](http://localhost:4000)
1. Done

## Notes

* A _config.dev.yml is used to override the Jekyll url parameter to http://localhost:4000
* OSX or Linux JEKYLL_ENV or force_polling parameters are not required.



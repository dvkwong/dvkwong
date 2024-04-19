---
title: Learning Docker
categories:
  - posts
tags:
  - Docker
---

## Creating a Docker image using a docker file

This example shows how to create a Microsoft Windows image with IIS installed. A list of [official Microsoft images](https://hub.docker.com/u/microsoft/) can be found on the docker hub website.

https://docs.microsoft.com/en-us/aspnet/mvc/overview/deployment/docker-aspnetmvc

1. Create a file called 'Dockerfile' with the below content.

```cs
# The nano server version is way smaller at roughly 400MB vs 4GB for the full Windows IIS
FROM microsoft/aspnet

# Copy YOUR files from your local drive to the Docker image, can be static html pages
COPY _site/ /inetpub/wwwroot
```

2. Create the docker image called myblog with a tag of iis

```cs
docker build -f .\Dockerfile -t myblog:iis .

or without specifying the Dockerfile as this is the default

docker build -t myblog:iis .
```
3. List newly created images and run the image

```cs
# View images
docker images

# Run the image
docker run -d --name my-running-site myblog:iis
```

4. View the website in the browser

```cs
# Get the docker ip address
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" my-running-site

Eg 172.22.208.164

Now open in browser Eg http://172.22.208.164
```





### Reference

* [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)


# What is this?

[locust](https://github.com/locustio/locust) A tool for performance test.

The image would be built automatically on [docker hub](https://cloud.docker.com/repository/docker/yuanxiang/locust) each time this repo is updated.

To test the build locally:

```sh
docker build -t yuanxiang/locust .
```
To start the docker:

```sh
docker run [imageid]
docker run -e LOCUST_MODE='master' -e MASTER_IP='10.2.3.239' [imageid]
docker run -e LOCUST_MODE='slave' -e MASTER_IP='10.2.3.239' [imageid]
```
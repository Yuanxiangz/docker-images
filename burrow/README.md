# What is this?

[Burrow](https://github.com/linkedin/Burrow) is a service that provides the metrics for kafka consumer lags. This directory provides a Dockerfile to build the docker image for Burrow.

The image would be built automatically on [docker hub](https://cloud.docker.com/repository/docker/yuanxiang/burrow) each time this repo is updated.

To test the build locally:

```sh
docker build -t yuanxiang/burrow .
```

To start the docker:

```sh
sudo docker run -p 8000:8000 -v ~/burrow.toml:/etc/burrow/burrow.toml -v ~/logs:/logs [imageid]
```
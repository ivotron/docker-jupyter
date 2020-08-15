# Jupyter image without `jovyan` user

Replicates the [`scipy-notebook`][scipy] image, with extra Jupyterlab 
extensions:

- juptext
- jupyterlab_vim

Usage is similar as [upstream image][upstream] but processes run as 
`root`, for example:

```bash
docker run --rm \
  -p 8888:8888 \
  -v "$PWD":/workspace \
  -w /workspace \
  ivotron/jupyter:9b87b1625445 \
    jupyter lab --allow-root --NotebookApp.token=''
```

## Pre-built images

Available at [`ivotron/jupyter`][hub]. Tags are similar to upstream 
tags.

## Motivation

On MacOS and Windows, being `root` inside a container is fine. Same 
for Linux when using [`podman`](https://podman.io).

[scipy]: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook
[upstream]: https://github.com/jupyter/docker-stacks
[hub]: https://hub.docker.com/repository/docker/ivotron/jupyter

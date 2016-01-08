# jupyter

Jupyter for python 3.4.x with pandas, matplotlib, pytables and h5py.
For more jupyter stacks, see [here](https://github.com/jupyter/docker-stacks).

Usage:

```bash
docker run \
    -d -p 8888:8888 \
    -v `pwd`:/home/jovyan/work \
  ivotron/jupyter-pd-mpl-h5
```

which makes `$PWD` the data folder that jupyter has available to it. 
Put CSVs/notebooks/scripts in this folder and point your browser to 
`localhost:8888` (or whatever hostname/URL the docker host is exposed 
on) to begin analyzing data.

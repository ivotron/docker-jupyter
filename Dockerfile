FROM jupyter/minimal-notebook:latest

USER jovyan

RUN conda install --yes \
      'pandas=0.17*' \
      'matplotlib=1.4*' \
      'pytables=3.2*' \
      'h5py=2.5*' && \
    conda clean -yt

USER root

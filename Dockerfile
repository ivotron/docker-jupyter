FROM jupyter/base-notebook:9b87b1625445

# rootify
USER root
ENV HOME=/root
WORKDIR $HOME

# replicates scipy-notebook, with extra extensions:
# - juptext
# - jupyterlab_vim
RUN conda install --quiet --yes \
      'beautifulsoup4=4.9.*' \
      'notebook=6.0.3' \
      'jupyterlab=2.1.5' \
      'conda-forge::blas=*=openblas' \
      'bokeh=2.1.*' \
      'bottleneck=1.3.*' \
      'cloudpickle=1.5.*' \
      'cython=0.29.*' \
      'dask=2.20.*' \
      'dill=0.3.*' \
      'h5py=2.10.*' \
      'hdf5=1.10.*' \
      'ipywidgets=7.5.*' \
      'ipympl=0.5.*'\
      'matplotlib-base=3.2.*' \
      'numba=0.48.*' \
      'numexpr=2.7.*' \
      'pandas=1.1.*' \
      'patsy=0.5.*' \
      'protobuf=3.12.*' \
      'pytables=3.6.*' \
      'scikit-image=0.17.*' \
      'scikit-learn=0.23.*' \
      'scipy=1.5.*' \
      'seaborn=0.10.*' \
      'sqlalchemy=1.3.*' \
      'statsmodels=0.11.*' \
      'sympy=1.6.*' \
      'vincent=0.4.*' \
      'widgetsnbextension=3.5.*'\
      'xlrd=1.2.*' && \
    conda clean --all -f -y && \
    jupyter notebook --generate-config && \
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager@^2.0.0 --no-build && \
    jupyter labextension install @bokeh/jupyter_bokeh@^2.0.0 --no-build && \
    jupyter labextension install jupyter-matplotlib@^0.7.2 --no-build && \
    jupyter labextension install @axlair/jupyterlab_vim@0.12.4 --no-build && \
    jupyter labextension install jupyterlab-jupytext@1.2.1 --no-build && \
    jupyter lab build -y && \
    jupyter lab clean -y && \
    npm cache clean --force && \
    rm -rf /root/.cache/yarn && \
    rm -rf /root/.node-gyp

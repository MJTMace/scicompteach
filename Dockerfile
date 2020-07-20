# Use jupyter/datascience-notebook as base image
FROM jupyter/datascience-notebook:5197709e9f23

# Add nbgrader and RISE
ADD requirements.txt .
RUN pip install --no-cache --no-cache-dir -r requirements.txt

# Set up exchange directory for nbgrader
USER root
RUN mkdir -p /srv/nbgrader/exchange && chmod 777 /srv/nbgrader/exchange

# Enable the Nbextensions for nbgrader
RUN jupyter nbextension install --sys-prefix --py nbgrader --overwrite
RUN jupyter nbextension enable --sys-prefix --py nbgrader
RUN jupyter serverextension enable --sys-prefix --py nbgrader

# Change back to standard notebook user
USER $NB_UID

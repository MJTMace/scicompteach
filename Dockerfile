FROM jupyter/datascience-notebook:5197709e9f23
ADD requirements.txt .
RUN pip install --no-cache --no-cache-dir -r requirements.txt

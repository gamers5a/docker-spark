FROM spark_base

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077 6066 8888


ENV ANACONDA_ROOT /opt/conda/
ENV PYSPARK_DRIVER_PYTHON $ANACONDA_ROOT/bin/jupyter
ENV PYSPARK_PYTHON $ANACONDA_ROOT/bin/python
ENV PYSPARK_DRIVER_PYTHON_OPTS 'notebook'

RUN conda install -c conda-forge pyspark findspark -y
RUN conda install jupyter -y

RUN pip install jupyter-spark
jupyter serverextension enable --py jupyter_spark
jupyter nbextension install --py jupyter_spark
jupyter nbextension enable --py jupyter_spark
jupyter nbextension enable --py widgetsnbextension

CMD ["/bin/bash", "/master.sh"]

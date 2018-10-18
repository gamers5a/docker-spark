#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

export ANACONDA_ROOT=~/anaconda3
export PYSPARK_DRIVER_PYTHON=$ANACONDA_ROOT/bin/ipython
export PYSPARK_PYTHON=$ANACONDA_ROOT/bin/python

/opt/conda/bin/conda install -c conda-forge pyspark findspark -y

/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root

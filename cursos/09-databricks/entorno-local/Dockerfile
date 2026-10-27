FROM apache/spark:4.0.1-scala2.13-java17-python3-ubuntu
USER root
RUN pip install --no-cache-dir nbclient nbformat ipykernel pandas pyarrow matplotlib delta-spark==4.0.0 pyspark==4.0.1 && python3 -m ipykernel install --name python3
ENV PYSPARK_PYTHON=python3 SPARK_HOME=/opt/spark PATH="/opt/spark/bin:${PATH}"
WORKDIR /work

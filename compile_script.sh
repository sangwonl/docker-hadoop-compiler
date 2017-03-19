#!/bin/bash

HADOOP_VERSION=${1:-2.7.2}

wget http://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION-src.tar.gz
tar xvfz hadoop-$HADOOP_VERSION-src.tar.gz
cd hadoop-$HADOOP_VERSION-src

echo -e "comiling hadoop-$HADOOP_VERSION..."
mvn package -Pdist,native -DskipTests -Dtar

echo -e "moving target binary to shared volume..."
mv ./hadoop-dist/target/hadoop-$HADOOP_VERSION.tar.gz /root/output

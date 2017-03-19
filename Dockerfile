FROM ubuntu:16.04

MAINTAINER Sangwon Lee <gamzabaw@gmail.com>

RUN apt-get update &&     \
    apt-get install -y    \
        build-essential   \
        openjdk-8-jdk     \
        maven             \
        wget              \
        cmake             \
        make              \
        automake          \
        autoconf          \
        libprotobuf-dev   \
        protobuf-compiler \
        pkg-config        \
        libssl-dev

RUN wget https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz && \
    tar xvzf protobuf-2.5.0.tar.gz && \
    cd protobuf-2.5.0 &&              \
    ./configure &&                    \
    make &&                           \
    make install &&                   \
    ldconfig

RUN cd / &&                  \
    rm -rf protobuf-2.5.0 && \
    rm protobuf-2.5.0.tar.gz

ADD compile_script.sh /root/
RUN chmod a+x /root/compile_script.sh

WORKDIR /root

ENTRYPOINT ["./compile_script.sh"]

FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN  echo 'test:test' | chpasswd

# install apt-file - useful for searching
RUN apt update  \
    && apt install -y apt-file \
    && apt-file update 

# install ip
RUN apt install -y iproute2

# install vi
RUN apt install -y vim

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
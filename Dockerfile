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

# This package has tools, amongst them, netstat
RUN apt install -y net-tools

# install vi
RUN apt install -y vim

# The newer way to manage service is with systemctl command of systemD system
# This (service) is another way
RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
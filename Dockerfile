FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/rahul -s /bin/bash -g root -G sudo -u 1000 rahul 

RUN  echo 'rahul:rahul' | chpasswd

RUN mkdir /home/rahul/.ssh

# This is the public key I created 
# The private key that goes with this is on my laptop
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7NSXxUSSVeDMQA7a8do0+bK1Kw/ezVL2JMeSVaM1N56epiaLzRiJc/I6TiH8yGYmW62Sj5eVLTc4boE9JlnmmzziYP/P8ptn96MLNmbTmidgBZO7s90+oBF9fIKBKLaJoTw5jnVf8BAcRJBhjwxSAIKU38D6p9CQscPZhERBAYWggBxd2/EF5BXOd+EFeFyIeN7yQquW9U1M+e1iWq9BJQDsYPRKqdRTNqN/nfpeCVfbKGYCFsmjGrDgKcN6vVwh4XYofiH8ivtivWWPuXdBoOGw3DcLC4vaR96oEquJo8KS4gkFdoWKiiM/f2CWfrc6QCLDPrtTIBKdOiMihoCDt0jypE1U+vJKx7EX+aKERiC9KgqRaLqSZk5nYSOU5A06bi2L75S5dkG1l23v7QoP9Mep+yVXruvHawRQfxi7wVTTKGoJbGAiHefMMcDBPgSYQDJClceP86ni39u8OaNGAB3vJpt7Jr0j3ISCJPbiOw86f8WZIS4WHYPXCOL86NFs= root@573ea31916af" > /home/rahul/.ssh/authorized_keys


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

# install tmux - great tool for managing sessions  (ctrl-B S)
RUN apt install -y tmux

# The newer way to manage service is with systemctl command of systemD system
# This (service) is another way
RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
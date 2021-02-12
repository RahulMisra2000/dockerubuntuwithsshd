# dockerubuntuwithsshd

ubuntu docker with sshd and a user called rahul

Connecting from windows host to the docker container
You can use putty and connect to the sshd service running in the container

Information from :
https://www.youtube.com/watch?v=t9T2gUyoWhs&list=PLT98CRl2KxKHtOhMYulS43hayRsGXLzmx&index=5

1. You can use the ssh-keygen on the Linux machine where openssh-server is installed, and create a key pair. This creates the id_rsa and id_rsa.pub key pair.
   2 a)Now the private key (id_rsa) will be provided to putty
   However, PuTTY cannot use keys in OpenSSH format.
   You need to convert your key to .ppk format first. For that, use PuTTYgen from PuTTY package.
   Run PuTTYgen;
   Press Load to load the private key in OpenSSH format;
   Press Save private key to save the private key in .ppk format
   2 b)The public key (id_rsa.pub) needs to be placed inside the user's home directories' .ssh folder .....
   in eg /home/rahul/.ssh/authorized_keys (Just paste it in there)
   3)We can also configure the sshd Server ( /etc/ssh/ssh_config) to disable password authentication and ONLY allow key authentication
   It can also be configured to allow certain users or users from a certain group to enter
   There are other configuration details as well
   Also, it is better to place configuration under /etc/ssh/ssh_config.d/\*.config file so that the configuration survives sshd upgrades

Next, start Putty, specify localhost and port 22 and then specify the location of the private key
At the login prompt, just type in the name of the user ... rahul in our example and you will successfully setup an ssh connection

// Public key
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDd4sq9gTNFqmWdcg6jwwhDM1smh6nshzXrC1VmpKlHxEmpNGi0lY240cvz17oVE85e4pzg4gFngSlQog0W6xWLTAKplJ2gYREkmBluKdQJ+aq8dP1x+e6VmwhauT4fhvOmzdiVFbEQRa4ngVZoEBw9K6Kk3d16uPnYMIMGypB1s6cigT/NKzUZiuABxLBrwBkDLg8C2nRujpTqtw3THnsayBBw+yNnN5iPnnNu8ZVWbvf7dzKCP2SpNns4i5urlJbd1bwD6wGzNQplHVzCZcoS1KugGtO0OtXZpdE6IV3+VpfWu3Eu982Kkfhl4V+UbVHTcQjAnwWISGhXpPR1Bj5JriztosDDlsT/J/zgFKDltBSoPq58wQK3GGODfLyRTl9a9SeUB5C8JHo6Up1BKk2Zg+lbmLKlmci+Yyn6mJH4zf8fYx25ya/uAlfLDs6qsVeQ16ArVr/rwRdGpl+3zHzu7P9jq6xEcdYB4+ym8Fu5yvAdl2t8em9MuJqhu/ogvj0= root@573ea31916af

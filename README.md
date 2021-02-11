# dockerubuntuwithsshd

ubuntu docker with sshd and a test user

Connecting from windows host to the docker container
You can use putty and connect to the sshd service running in the container
Or
You can use the ssh client that seems to be available in windows machines also, just type ssh

ssh <user>@localhost

Information from :
https://www.youtube.com/watch?v=t9T2gUyoWhs&list=PLT98CRl2KxKHtOhMYulS43hayRsGXLzmx&index=5
You can use the ssh-keygen on the client machine and create a key pair. This creates the id_rsa and id_rsa.pub key pair
Next, use the ssh-copy-id on the client machine and copy the public key over to the sshd server machine
But I can't find the ssh-copy-id command on windows. So, maybe I could do this from a linux machine and then see how a public key gets added to the sshd server machine (i think under authorized keys file ... something like that)
Then in putty I could specify the ssh private key location and then I should be able to connect passwordless to the sshd server machine
We can also configure the sshd Server ( /etc/ssh/ssh_config) to disable password authentication and ONLY allow key authentication
It can also be configured to allow certain users or users from a certain group to enter
There are other configuration details as well
Also, it is better to place configuration under /etc/ssh/ssh_config.d/\*.config file so that the configuration survives sshd upgrades

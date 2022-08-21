# automate
#### 1.) Prepare virtual machine  


Best is to do as root.  
Install latest debain image and run:

```shell
apt-get update
apt-get install -y wget bash-completion python3
```

1.1) Setup Master and Slave node  
On Master node generate ssh-key ( ssh-keygen ). Put .pub to authorized\_keys on slave nodes.  
check if ssh from master to slaves work.  
With your favorite editor edit /etc/hosts, add all hosts ( IP hostname )  
  
example:

```
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters

192.168.253.180 portainer1
192.168.253.181 portainer2
192.168.253.182 portainer3
```

#### 2.) Install portainer

On Master node :

```shell
git clone https://github.com/brucar18/automate.git
```

Move into automate dir and edit hosts.yaml

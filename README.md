# automate
#### 1.) Prepare virtual machine  


Best is to do as root.  
Install latest debain image and run:

```shell
apt-get update
apt-get install -y wget bash-completion git python3
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

in root folder clone repo

```shell
git clone https://github.com/brucar18/automate.git
```

Move into automate dir and edit hosts.yaml

Edit host name and ip addresses to match yours in /etc/hosts

Move to automate folder and run installBase.sh script

```shell
./installBase.sh 
```

To have access to ansible links run this command:

```shell
export PATH=$HOME/.local/bin:$PATH
```

  
In automate folder run:

This will prepare master and slave hosts  
All playbooks are run from master as root

```shell
ansible-playbook -i hosts.yaml main.yaml
```

Setup portainer master and init swarm:

```shell
ansible-playbook -i hosts.yaml server.yaml
```

Setup swarm agents  
  
First generate swarm agent task and then depoy it.

```shell
./gen_swarm.sh
ansible-playbook -i hosts.yaml swarm.yaml
```

Then login to portainer master node and create admin account  
[https://masternodeip:9443](https://masternodeip:9443)

#### 3.) Prepare dockers

run playbook so it will build image on all 3 nodes.

```shell
ansible-playbook -i hosts.yaml buildImages.yaml
```

after this task is completed go to Portainer web and create new stack  
  
1.) Choose local, then select stack and Add stack  

  
Copy content of docker-compose.yaml into web editor. Disable access control and deploy stack.  

  
Voila your webserver is up and running.

  

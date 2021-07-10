FROM ubuntu:20.04

ARG HOST_RSA_KEY

# Install SSH Server
RUN apt-get update && \
	apt-get install -y --no-install-recommends openssh-server && \
	echo $HOST_RSA_KEY > /etc/ssh/ssh_host_rsa_key && \
	ssh-keygen -A && \
	mkdir -p /run/sshd

# Install base packages
RUN apt-get update && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y --no-install-recommends \
		# Base system utils
		zsh nano git openssh-client apt-transport-https curl bash \
		gnupg sudo man-db bash-completion wget unzip less \
		locales file pwgen htop jq ldap-utils \
		# Network tools
		nmap mtr-tiny host net-tools \
		# Required for packer to create iso files
		genisoimage	&& \
	echo "%sudo ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	echo "en_UK.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen

# Python
RUN apt-get install -y --no-install-recommends \
		python3.9 python3-pip python3-venv python3-setuptools && \
	pip3 install wheel && \
	pip3 install pipenv

RUN groupadd -g 999 -r docker

# User jens
RUN useradd -m -s /bin/zsh -G sudo,docker jens && \
	su -c "ssh-keygen -b 2048 -f /home/jens/.ssh/id_rsa -t rsa -q -N ''" jens && \
	passwd -d jens

# minio mc
RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/mc > /usr/bin/mc && \
	chmod +x /usr/bin/mc

# kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
	echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
	apt-get update && \
	apt-get install --no-install-recommends -y kubectl

# kubectx && kubens
RUN curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx > /usr/local/bin/kubectx && \
	curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens > /usr/local/bin/kubens && \
	curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubectx.zsh > /etc/zsh/kubectx.zsh && \
	curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubens.zsh > /etc/zsh/kubens.zsh && \
	chmod +x /usr/local/bin/kubectx && \
	chmod +x /usr/local/bin/kubens

# docker-cli
RUN curl -s https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
	echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" > /etc/apt/sources.list.d/docker-ce.list && \
	apt-get update && \
	apt-get install --no-install-recommends -y docker-ce-cli

# rke
RUN curl -L https://github.com/rancher/rke/releases/latest/download/rke_linux-amd64 > /usr/bin/rke && \
	chmod +x /usr/bin/rke

# helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# rancher
RUN curl -L https://releases.rancher.com/cli2/v2.4.10/rancher-linux-amd64-v2.4.10.tar.gz | tar xvzf - --strip-components=2 && \
	mv rancher /usr/bin/rancher && \
	chmod +x /usr/bin/rancher

# terraform, vault and packer
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	echo "deb [arch=amd64] https://apt.releases.hashicorp.com focal main" > /etc/apt/sources.list.d/hashicorp.list && \
	apt-get update && \
	apt-get install -y terraform vault packer && \
	# Allow running of vault without root
	setcap cap_ipc_lock= /usr/bin/vault

# powershell
RUN curl -L https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb > packages-microsoft-prod.deb && \
	dpkg -i packages-microsoft-prod.deb && \
	apt-get update && \
	apt-get install --no-install-recommends -y powershell

# govc
RUN curl -L https://github.com/vmware/govmomi/releases/latest/download/govc_Linux_x86_64.tar.gz | gunzip - > govc && \
	mv govc /usr/bin/govc && \
	chmod +x /usr/bin/govc

# Starship
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# FluxCD
RUN curl -s https://fluxcd.io/install.sh | sudo bash

COPY ./authorized_keys /home/jens/.ssh/authorized_keys
COPY ./sshd_config /etc/ssh/sshd_config

RUN chmod 700 /home/jens/.ssh && \
	chown jens: /home/jens/.ssh/authorized_keys && \
	chmod 600 /home/jens/.ssh/authorized_keys && \
	chown root: /etc/ssh/sshd_config

HEALTHCHECK CMD \
	bash -c '! ssh -o PasswordAuthentication=No root@localhost true 2>&1 | grep -i -c  refused'

CMD ["/usr/sbin/sshd", "-D", "-e"]

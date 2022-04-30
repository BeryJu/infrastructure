FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Install SSH Server
RUN apt-get install -y --no-install-recommends openssh-server && \
	ssh-keygen -A && \
	mkdir -p /run/sshd

# Install base packages
RUN yes | unminimize && \
	apt-get install -y --no-install-recommends \
		# Base system utils
		nano git openssh-client apt-transport-https curl bash \
		gnupg sudo man-db bash-completion wget unzip less locales \
		build-essential file pwgen htop jq ldap-utils software-properties-common rsync \
		# Fancy shell stuff
		bat fzf \
		# Network tools
		nmap mtr-tiny host net-tools iputils-ping traceroute \
		# Required for packer to create iso files
		genisoimage && \
	echo "%sudo ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	echo "en_UK.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen

# Python
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
	apt-get install -y --no-install-recommends \
		python3.10-venv python3.9 python3-pip python3-venv python3-setuptools && \
	pip3 install wheel && \
	pip3 install poetry

# Golang
RUN add-apt-repository ppa:longsleep/golang-backports -y && \
	apt install -y --no-install-recommends golang-go

# Node
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
	apt-get install -y --no-install-recommends nodejs

# Fish
RUN apt-add-repository ppa:fish-shell/release-3 -y && \
	apt-get install -y --no-install-recommends fish

# chezmoi
RUN curl -L https://github.com/twpayne/chezmoi/releases/download/v2.8.0/chezmoi_2.8.0_linux_amd64.deb > chezmoi.deb && \
	dpkg -i chezmoi.deb

# Korb
RUN curl -L https://github.com/BeryJu/korb/releases/latest/download/korb_linux_amd64 > korb && \
	mv korb /usr/bin/korb && \
	chmod +x /usr/bin/korb

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
	curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubectx.fish > /etc/fish/completions/kubectx.fish && \
	curl -L https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/kubens.fish > /etc/fish/completions/kubens.fish && \
	chmod +x /usr/local/bin/kubectx && \
	chmod +x /usr/local/bin/kubens

# Kubernetes stern
RUN curl -L https://github.com/stern/stern/releases/download/v1.19.0/stern_1.19.0_linux_amd64.tar.gz | tar xvzf - --strip-components=1 && \
	mv stern /usr/bin/stern && \
	chmod +x /usr/bin/stern

# rke
RUN curl -L https://github.com/rancher/rke/releases/latest/download/rke_linux-amd64 > /usr/bin/rke && \
	chmod +x /usr/bin/rke

# helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash && \
	helm completion fish > /etc/fish/completions/helm.fish

# rancher
RUN curl -L https://releases.rancher.com/cli2/v2.4.11/rancher-linux-amd64-v2.4.11.tar.gz | tar xvzf - --strip-components=2 && \
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
RUN curl -L https://github.com/vmware/govmomi/releases/latest/download/govc_Linux_x86_64.tar.gz | tar xvzf - && \
	mv govc /usr/bin/govc && \
	chmod +x /usr/bin/govc

# istioctl
RUN curl -L https://github.com/istio/istio/releases/download/1.13.1/istio-1.13.1-linux-amd64.tar.gz | tar xvzf - && \
	mv istio-1.13.1/bin/istioctl /usr/bin/istioctl && \
	chmod +x /usr/bin/istioctl

# puppet
RUN curl -L https://apt.puppet.com/puppet7-release-focal.deb > puppet.deb && \
	dpkg -i puppet.deb && \
	apt-get update && \
	apt-get install --no-install-recommends -y puppet-agent r10k

# doctl
RUN curl -sL https://github.com/digitalocean/doctl/releases/download/v1.71.0/doctl-1.71.0-linux-amd64.tar.gz | tar -xzv && \
	chmod +x doctl && \
	mv doctl /usr/bin/doctl

# Starship
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# FluxCD
RUN curl -s https://fluxcd.io/install.sh | sudo bash && \
	flux completion fish > /etc/fish/completions/flux.fish

# code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh -s --

COPY ./sshd_config /etc/ssh/sshd_config

# User jens
RUN useradd -m -s /bin/fish -G sudo jens && \
	su -c "ssh-keygen -b 2048 -f /home/jens/.ssh/id_rsa -t rsa -q -N ''" jens && \
	passwd -d jens && \
	chmod 700 /home/jens/.ssh && \
	curl -L https://github.com/BeryJu.keys > /home/jens/.ssh/authorized_keys && \
	chown jens: /home/jens/.ssh/authorized_keys && \
	chmod 600 /home/jens/.ssh/authorized_keys && \
	chown root: /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D", "-e"]

FROM ubuntu:18.04

# Install SSH Server
RUN apt-get update && \
	apt-get install -y --no-install-recommends openssh-server && \
	ssh-keygen -A && \
        mkdir -p /run/sshd

# Install base packages
RUN apt-get update && \
	apt-get install -y --no-install-recommends zsh nano git openssh-client apt-transport-https curl bash nmap gnupg sudo man-db python3 python3-pip python3-venv bash-completion wget unzip python3-setuptools mtr-tiny locales file pwgen host htop && \
	pip3 install wheel && \
	pip3 install pipenv && \
	echo "%sudo ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	echo "en_UK.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen

RUN groupadd -g 999 -r docker

# User jens
RUN useradd -m -s /bin/zsh -G sudo,docker jens && \
	su -c "ssh-keygen -b 2048 -f /home/jens/.ssh/id_rsa -t rsa -q -N ''" jens && \
	passwd -d jens

# kubelet
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

# kube-ps1
RUN curl -L https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh > /etc/zsh/kube-ps1.sh && \
	chmod +x /etc/zsh/kube-ps1.sh

# awscli
RUN pip3 install awscli

# docker-cli
RUN curl -s https://download.docker.com/linux/debian/gpg | apt-key add - && \
	echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" > /etc/apt/sources.list.d/docker-ce.list && \
	apt-get update && \
	apt-get install --no-install-recommends -y docker-ce-cli

# rke
RUN curl -L https://github.com/rancher/rke/releases/download/v1.0.6/rke_linux-amd64 > /usr/bin/rke && \
	chmod +x /usr/bin/rke

# helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# rancher
RUN curl -L https://releases.rancher.com/cli2/v2.4.0/rancher-linux-amd64-v2.4.0.tar.gz | tar xvzf - --strip-components=2 && \
	mv rancher /usr/bin/rancher && \
	chmod +x /usr/bin/rancher

# terraform
RUN curl -L https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip > terraform.zip && \
	unzip terraform.zip && \
	mv terraform /usr/bin/terraform

# minio mc
RUN curl -L https://dl.min.io/client/mc/release/linux-amd64/mc > /usr/bin/mc && \
	chmod +x /usr/bin/mc

# powershell
RUN curl -L https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb > packages-microsoft-prod.deb && \
	dpkg -i packages-microsoft-prod.deb && \
	apt-get update && \
	apt-get install --no-install-recommends -y powershell

# govc
RUN curl -L https://github.com/vmware/govmomi/releases/download/v0.22.1/govc_linux_amd64.gz | gunzip - > govc && \
	mv govc /usr/bin/govc && \
	chmod +x /usr/bin/govc

COPY ./authorized_keys /home/jens/.ssh/authorized_keys
COPY ./sshd_config /etc/ssh/sshd_config

RUN chmod 700 /home/jens/.ssh && \
	chown jens: /home/jens/.ssh/authorized_keys && \
	chmod 600 /home/jens/.ssh/authorized_keys && \
	chown root: /etc/ssh/sshd_config

HEALTHCHECK CMD \
	bash -c '! ssh -o PasswordAuthentication=No root@localhost true 2>&1 | grep -i -c  refused'

CMD ["/usr/sbin/sshd", "-D", "-e"]

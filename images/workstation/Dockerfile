FROM ubuntu:24.04

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
		gnupg sudo man-db bash-completion wget unzip less locales screen \
		build-essential file pwgen htop jq ldap-utils software-properties-common rsync \
		# Fancy shell stuff
		bat fzf \
		# Network tools
		nmap mtr-tiny host net-tools iputils-ping traceroute dnsutils \
		# Dev stuff
		pkg-config libxmlsec1-dev && \
	echo "%sudo ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	echo "en_UK.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen

# Python
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
	apt-get install -y --no-install-recommends \
		python3.11-venv python3.11-dev python3-pip python3-venv python3-setuptools python3-poetry

# Golang
# RUN add-apt-repository ppa:longsleep/golang-backports -y && \
RUN	apt install -y --no-install-recommends golang-go

# Node
RUN apt-get install -y ca-certificates curl gnupg && \
	mkdir -p /etc/apt/keyrings && \
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
	echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list && \
	apt-get update && \
	apt-get install nodejs -y

# Fish
RUN apt-add-repository ppa:fish-shell/release-3 -y && \
	apt-get install -y --no-install-recommends fish

# chezmoi
RUN curl -L https://github.com/twpayne/chezmoi/releases/download/v2.27.0/chezmoi_2.27.0_linux_amd64.deb > chezmoi.deb && \
	dpkg -i chezmoi.deb && \
	rm -f chezmoi.deb

# Korb
RUN curl -L https://github.com/BeryJu/korb/releases/latest/download/korb_linux_amd64 > korb && \
	mv korb /usr/bin/korb && \
	chmod +x /usr/bin/korb

# minio mc
COPY --from=quay.io/minio/minio:RELEASE.2024-04-06T05-26-02Z /bin/mc /usr/bin/mc

# kubectl
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
	echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
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

# aws CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	sudo ./aws/install && \
	rm awscliv2.zip

# terraform and vault
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
	echo "deb [arch=amd64] https://apt.releases.hashicorp.com focal main" > /etc/apt/sources.list.d/hashicorp.list && \
	apt-get update && \
	apt-get install -y terraform vault && \
	# Allow running of vault without root
	setcap cap_ipc_lock= /usr/bin/vault

# istioctl
COPY --from=istio/istioctl:1.26.3 /usr/local/bin/istioctl /usr/bin/istioctl

# puppet
RUN curl -L https://apt.puppet.com/puppet7-release-focal.deb > puppet.deb && \
	dpkg -i puppet.deb && \
	apt-get update && \
	apt-get install --no-install-recommends -y puppet-agent r10k && \
	rm -f puppet.deb

# Starship
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
RUN starship init fish --print-full-init > /etc/fish/conf.d/starship.fish

# FluxCD
COPY --from=fluxcd/flux-cli:v2.6.4 /usr/local/bin/flux /usr/bin/flux
RUN flux completion fish > /etc/fish/completions/flux.fish

# Hugo
COPY --from=klakegg/hugo:0.111.3-ext-ubuntu /usr/lib/hugo/hugo /usr/bin/hugo
RUN hugo completion fish > /etc/fish/completions/hugo.fish

# code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh -s --

# kaniko
COPY --from=gcr.io/kaniko-project/executor:v1.24.0 /kaniko/executor /usr/bin/kaniko

# etcdctl
COPY --from=quay.io/coreos/etcd:v3.6.4 /usr/local/bin/etcdctl /usr/bin/etcdctl

COPY ./sshd_config /etc/ssh/sshd_config

COPY ./kubectl-merge.sh /usr/bin/kubectl-merge

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

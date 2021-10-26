all: lint

lint:
	ansible-lint -v --force-color \
			site.yml \
			actions/cleanup.yml \
			actions/update.yml \
			actions/sentry-cleanup.yml \
			provisioning/new-vm.yml \
			awx/site.yaml \
			vsphere/site.yaml

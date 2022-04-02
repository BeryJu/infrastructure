all: lint

lint:
	ansible-lint -v --force-color \
			actions/cleanup.yaml \
			actions/update.yaml \
			actions/sentry-cleanup.yaml \
			provisioning/new-vm.yaml

# Build and push Network Debugger image.

# This image is built from files in this directory and pushed to
# a docker registry that is accesseble on each node.

# For a user created registry, the registry must be setup ahead of time.
# The registry is configured in /etc/containers/registries.conf
# on each node in both "registries:" and "insecure_registries:" sections.

all: build push

build: 
	docker build -t avishnoi/ndb -f Dockerfile .

clean: 
	echo "Clean up the existing ndb image"
	docker rmi avishnoi/ndb:latest


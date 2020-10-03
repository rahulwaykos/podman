#!/bin/bash

podman pull docker.io/jboss/wildfly

id=$(podman inspect --format "{{.Id}}" jboss/wildfly )

port=$(podman inspect $id --format "{{.ContainerConfig.ExposedPorts}}" | grep -o '[0-9]*')

podman run -d --name wildfly -p 8085:$port wildfly

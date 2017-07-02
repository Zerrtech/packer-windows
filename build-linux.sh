#!/bin/bash

last_version=$(cat VERSION)
new_version=$((last_version + 1))
echo $new_version > VERSION

VARIABLES="-var access_token=$VAGRANT_CLOUD_TOKEN -var version=$new_version"

for windows_version in 2016 2016_docker 2016_docker_core 10_docker 10_insider 10; do
	packer build $VARIABLES -except hyperv-iso windows_${windows_version}.json
done

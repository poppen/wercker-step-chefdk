#!/bin/sh

# if no version is provided use the latest version
if [ -z "${WERCKER_CHEFDK_VERSION}" ]; then
    export WERCKER_CHEFDK_VERSION=0.4.0
fi

export CHEF_DEB=chefdk_${WERCKER_CHEFDK_VERSION}-1_amd64.deb
export CHEF_CACHE_DIR=${WERCKER_CACHE_DIR}/wercker/chefdk

mkdir -p "$CHEF_CACHE_DIR"
if [ ! -f "${CHEF_CACHE_DIR}/${CHEF_DEB}" ]; then
    wget --no-check-certificate -P "$CHEF_CACHE_DIR" "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/${86_64CHEF_DEB}"
fi
sudo dpkg -i "${CHEF_CACHE_DIR}/${CHEF_DEB}"

chef --version

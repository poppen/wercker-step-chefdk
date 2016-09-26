#!/bin/sh

# if no version is provided use the latest version
if [ -z "${WERCKER_CHEFDK_VERSION}" ]; then
    export WERCKER_CHEFDK_VERSION=0.5.1
fi

export CHEF_DEB=chefdk_${WERCKER_CHEFDK_VERSION}-1_amd64.deb
export CHEF_CACHE_DIR=${WERCKER_CACHE_DIR}/wercker/chefdk

mkdir -p "$CHEF_CACHE_DIR"
if [ ! -f "${CHEF_CACHE_DIR}/${CHEF_DEB}" ]; then
    wget --no-check-certificate -P "$CHEF_CACHE_DIR" "https://packages.chef.io/stable/ubuntu/12.04/${CHEF_DEB}"
fi
sudo dpkg -i "${CHEF_CACHE_DIR}/${CHEF_DEB}"

chef --version

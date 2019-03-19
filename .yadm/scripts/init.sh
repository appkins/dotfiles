#!/usr/bin/env bash

function _get_os() {
    cat /etc/*-release | grep ^ID= | tr -d '^[ID=]'
}


OS=$( _get_os )

echo "${OS}"

if [ "${OS}" == "arch" ]; then
    . "${BASH_SOURCE%/*}/_arch.sh"
elif [ "${OS}" == "debian" ]; then
    . "${BASH_SOURCE%/*}/_debian.sh"
fi

_init
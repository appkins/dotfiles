#!/usr/bin/env bash

function _get_os() {
    cat /etc/*-release | grep ^ID= | tr -d '^[ID=]'
}


OS=$( _get_os )

echo "${OS}"


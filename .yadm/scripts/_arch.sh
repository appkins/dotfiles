#!/usr/bin/env bash

function _arch_keys() {
    sudo pacman-key --init
    sudo pacman-key --populate
}

function _install() {
    yay -S --noconfirm "$@"
}

function _install_yay() {
    if ! [ -x "$(command -v yay)" ]; then
        set -xe
        sudo pacman -Sy --noconfirm git
        mkdir -p temp-yay-repos
        cd temp-yay-repos
        git clone https://aur.archlinux.org/package-query.git
        cd package-query
        makepkg -si
        cd ..
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd ../..
        rm -rf temp-yay-repos
    else
        echo "yay is already installed"
    fi
}

function _init() {
    _install_yay
    _install zsh oh-my-zsh-git i3-gaps polybar compton
}

#!/usr/bin/env bash

is_installed() {
    apt list --installed 2>/dev/null | sed -E 's|([^/]+)/.*|\1|' >apt.list
    for PACKAGE in "${APT_PACKAGES[@]}"; do
        grep -q "^$PACKAGE\$" apt.list || return 1
    done
    return 0
}

install() {
    sudo add-apt-repository -y ppa:yunnxx/elementary
    sudo apt-get update -qq
    sudo apt-get install -qqy "${APT_PACKAGES[@]}"
    sudo sed -i "s/GNOME;\$/GNOME;Pantheon;/" /etc/xdg/autostart/indicator-application.desktop
    printf "[User]\nSystemAccount=true\n" | sudo tee /var/lib/AccountsService/users/libvirt-qemu
    sudo systemctl restart accounts-daemon.service
}

APT_PACKAGES=(
    apt-transport-https
    autoconf
    automake
    bridge-utils
    build-essential
    curl
    dkms
    dmg2img
    dstat
    git
    htop
    indicator-application
    kazam
    libbz2-dev
    libguestfs-tools
    libncurses5-dev
    libncursesw5-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    libtool
    libvirt-bin
    llvm
    nano
    ncdu
    qemu
    qemu-kvm
    software-properties-common
    tmux
    tree
    uml-utilities
    virt-manager
    virt-top
    virtinst
    wget
    wingpanel-indicator-ayatana
    xclip
    xsltproc
    xz-utils
    zlib1g-dev
    zsh
)

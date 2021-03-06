#!/usr/bin/env bash

is_installed() {
    cmd slack
}

install() {
    SLACK_VER=$(latest https://slack.com/intl/en-hu/downloads/linux "Version $VERSION_RE")
    curl -O "https://downloads.slack-edge.com/linux_releases/slack-desktop-$SLACK_VER-amd64.deb"
    sudo dpkg --install slack-desktop-*.deb || sudo apt-get install -fqqy
}

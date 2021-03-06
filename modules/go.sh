#!/usr/bin/env bash

is_installed() {
    cmd go
}

install() {
    GO_VER=$(latest golang/go "/go$VERSION_RE\"")
    GO_URL=https://dl.google.com/go/go$GO_VER.linux-amd64.tar.gz
    curl "$GO_URL" | tar -xzC "$LOCAL"
    ln -s "$LOCAL/go/bin/"* "$LOCAL/bin"
}

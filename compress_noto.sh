#!/bin/bash

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

tar --wildcards -xvzf "$1" -C "$WORKDIR" --strip-components=1
rm -rf "$WORKDIR"/{alpha,images,phaseIII_only}
tar --wildcards -cv --owner=root:0 --group=root:0 --numeric-owner --sort=name -C "$WORKDIR" . | xz -9e -  > "$2"

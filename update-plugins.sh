#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

pushd bundle
for P in *; do
	pushd "$P"
	git pull
	popd
done
popd

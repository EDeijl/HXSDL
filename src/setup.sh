#!/bin/bash

# iOS Configuration
if [[ $(uname ) == 'Darwin' ]] ; then
    if  [[ ! -f arm-apple-darwin10-ghc ]] ; then
        (cd submodules/ghc-ios-scripts; ./ionstallGHCiOS.sh)
    fi
fi

# Android Configuration
(cd submodules/docker; docker build -t android_build_env .)

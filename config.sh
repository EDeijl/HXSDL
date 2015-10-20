#!/bin/bash

# iOS Configuration
if [[ $(uname) == 'Darwin' ]] ; then
    (cd submodules/ghc-ios-scripts; ./installGHCiOS.sh)
fi


# Android Configuration
(cd submodules/docker; docker build -t HXSDL_build_env)

#!/bin/bash

#
# Copies the source files to the android project destination
#

cp HXSDL.cabal platforms/android/
cp LICENSE platforms/android/
cp src/* platforms/android/src/

cd platforms/android

#
# Do a search and replace in the cabal file to acommodate for a weird bug that can be fixed
# by building the project twice with different cabal settings
#

original=`awk -v RS='' -v ORS='\n\n' '-- Android executable' HXSDL.cabal`
replacement=`sed 's/-optl-shared/-shared/' cat $original`
perl -0pe 's/$original/$replacement' HXSDL.cabal


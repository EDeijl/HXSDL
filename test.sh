#!/bin/bash

original=`awk -v RS='' -v ORS='\n\n' '/-- Android executable/p' HXSDL.cabal`
replacement=`sed 's/-optl-shared/-shared/'< $original`
perl -0pe 's/$original/$replacement/' HXSDL.cabal

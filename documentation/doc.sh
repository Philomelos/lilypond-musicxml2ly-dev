#!/bin/bash
#rm -r html
#mkdir html
here=$(pwd)
lily=`cat $(which lilypond)|grep "export LD_LIBRARY_PATH"|cut -d = -f2-`
lily=`echo $lily|sed -e "s/\"//g"`
cd $lily/..
epydoc -o $here/html --html --graph all /Users/pls/lilypond-musicxml2ly-dev/lilylib.py /Users/pls/lilypond-musicxml2ly-dev/musicexp.py /Users/pls/lilypond-musicxml2ly-dev/musicxml.py /Users/pls/lilypond-musicxml2ly-dev/musicxml2ly

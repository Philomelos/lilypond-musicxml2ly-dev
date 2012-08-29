#!/bin/bash
#rm -r html
#mkdir html
here=$(pwd)
lily=`cat $(which lilypond)|grep "export LD_LIBRARY_PATH"|cut -d = -f2-`
lily=`echo $lily|sed -e "s/\"//g"`
cd $lily/..
epydoc -o $here/html --html --graph all share/lilypond/current/python/lilylib.py share/lilypond/current/python/musicexp.py share/lilypond/current/python/musicxml.py bin/musicxml2ly

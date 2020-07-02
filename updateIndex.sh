#!/bin/bash

date
find . -type f \( -name "*.[ch]" -o -name "*.cpp" \) -print > cscope.files
#find . -type f -name *.dpl >> cscope.files
find . -type f -name *.cc >> cscope.files
find . -type f -name *.C >> cscope.files
find . -type f -name *.hh >> cscope.files

if [ $# -eq 1 ]; then
    # remove test related files
    echo "excludes some test files..."
    mv cscope.files cscope.files.bak
    sed -e '/_test/d;/UnitTest/d;/\/test\//d' cscope.files.bak > cscope.files
    rm -f cscope.files.bak
fi

cscope -b

find  . -name \*.py -print | xargs etags

date


#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
: "${CPPCHECK_DIR:=$DIR/cppcheck/}"

if [ ! -d "$CPPCHECK_DIR" ]; then
  git clone https://github.com/danmar/cppcheck.git $CPPCHECK_DIR
fi

cd $CPPCHECK_DIR
git fetch --all
git checkout aca3f6fefa6d6b8c5915f15035c7e5908961f6f1
#git -c user.name=a -c user.email="a@b.c" cherry-pick 7199dde1618b5166735f07619dcdb9f4eafdb557
make clean
make MATCHCOMPILTER=yes CXXFLAGS="-O2" -j8

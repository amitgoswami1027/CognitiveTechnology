#!/usr/bin/env bash

THISDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
FLAG=""
export SOAR_HOME="$THISDIR/bin"
export DYLD_LIBRARY_PATH="$SOAR_HOME"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  if [ ! -e $SOAR_HOME/pkgIndex.tcl ]; then
    echo 'First time initialization of Soar for Linux...'
    mv $SOAR_HOME/linux64/swt.jar $SOAR_HOME/java/
    mv $SOAR_HOME/linux64/* $SOAR_HOME/
    rm -rf $SOAR_HOME/mac64
    rm -rf $SOAR_HOME/windows64
    rm -rf $SOAR_HOME/linux64
    rm -f $THISDIR/*.bat
  fi
elif [[ "$unamestr" == 'Darwin' ]]; then
  if [ ! -e $SOAR_HOME/pkgIndex.tcl ]; then
    echo 'First time initialization of Soar for Mac OSX...'
    mv $SOAR_HOME/mac64/swt.jar $SOAR_HOME/java/
    mv $SOAR_HOME/mac64/* $SOAR_HOME/
    rm -rf $SOAR_HOME/mac64
    rm -rf $SOAR_HOME/linux64
    rm -rf $SOAR_HOME/win64
    rm -f $THISDIR/*.bat
  fi
  FLAG="-XstartOnFirstThread"
else
  if [ ! -e $SOAR_HOME/pkgIndex.tcl ]; then
    echo 'First time initialization of Soar for an unsupported OS.  Assuming Linux.'
    mv $SOAR_HOME/linux64/swt.jar $SOAR_HOME/java/
    mv $SOAR_HOME/linux64/* $SOAR_HOME/
    rm -rf $SOAR_HOME/mac64
    rm -rf $SOAR_HOME/win64
    rm -rf $SOAR_HOME/linux64
    rm -f $THISDIR/*.bat
  fi
fi

pushd $SOAR_HOME > /dev/null
java $FLAG -Djava.library.path="$SOAR_HOME" -jar "$SOAR_HOME/SoarJavaDebugger.jar" $1 $2 $3 $4 $5 &
popd > /dev/null

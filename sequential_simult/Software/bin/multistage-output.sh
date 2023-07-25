#!/bin/sh

# $Id: multistage-output.sh 1539 2010-06-25 18:55:53Z wmyuan $

MAINCLASS="edu.caltechUcla.sselCassel.projects.multistage.outputService.OutputService"

if [ -z "$JAVA_HOME" ] ; then
  JAVA=`which java`
  if [ -z "$JAVA" ] ; then
    echo "Cannot find java, please modify your PATH to include java or set the JAVA_HOME env var."
    exit 1
  fi
else
  JAVA=$JAVA_HOME/bin/java
fi

LOCALCLASSPATH=`echo ../lib/*.jar | tr ' ' ':'`

if [ "$CLASSPATH" != "" ] ; then
  LOCALCLASSPATH=$CLASSPATH:$LOCALCLASSPATH
fi


LOCALCLASSPATH=$LOCALCLASSPATH

$JAVA -classpath $LOCALCLASSPATH $MAINCLASS $1 $2 $3 $4


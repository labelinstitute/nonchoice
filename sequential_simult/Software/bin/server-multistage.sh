#!/bin/sh

# $Id: server-multistage.sh 1539 2010-06-25 18:55:53Z wmyuan $

CONFDIR="../conf"
PROPFILE="$CONFDIR/log4j.properties"
MAINCLASS="edu.caltechUcla.sselCassel.projects.multistage.server.StartServer"

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


LOCALCLASSPATH=$LOCALCLASSPATH:$CONFDIR

$JAVA -classpath $LOCALCLASSPATH -Dprop.home=$CONFDIR:$PROPFILE $MAINCLASS 


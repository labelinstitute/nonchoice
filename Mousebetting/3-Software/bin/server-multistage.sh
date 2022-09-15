#!/bin/sh

# $Id: server-multistage.sh 472 2003-06-20 06:38:00Z miao $

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


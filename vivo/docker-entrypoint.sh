#! /bin/bash

# Should be tdbContentTripleSource or sparqlContentTripleSource
if [[ -z $VIVO_CONTENT_TRIPLE_SOURCE ]] ; then
  export VIVO_CONTENT_TRIPLE_SOURCE="tdbContentTripleSource"
fi

content=$(cat runtime.properties.tpl)
for var in $(compgen -e); do
  content=$(echo "$content" | sed "s|{{$var}}|${!var}|g") 
done
echo "$content" > runtime.properties

content=$(cat applicationSetup.n3.tpl)
for var in $(compgen -e); do
  content=$(echo "$content" | sed "s|{{$var}}|${!var}|g") 
done
echo "$content" > applicationSetup.n3

if [ -f "/usr/local/vivo/home/tdbModels/tdb.lock" ] ; then
  echo "WARNING: tdbModels lock file found.  removing."
  rm /usr/local/vivo/home/tdbModels/tdb.lock
fi 
if [ -f "/usr/local/vivo/home/tdbContentModels/tdb.lock" ] ; then
  echo "WARNING: tdbContentModels lock file found.  removing."
  rm /usr/local/vivo/home/tdbContentModels/tdb.lock
fi 

catalina.sh run
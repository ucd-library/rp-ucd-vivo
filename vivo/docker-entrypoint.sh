#! /bin/bash

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


catalina.sh run
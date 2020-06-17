# VIVO Dockerfile

This file builds and runs the main vivo application.

# Configuration

The `applicationSetup.n3` and `runtime.properties` files are templates. `/docker-entrypoint.sh` replaces environmental variable
names inside `applicationSetup.n3` and `runtime.properties` before
running.

## Variables

 - `VIVO_SOLR_HOSTNAME` Solr host name in docker-compose
 - `VIVO_CONTENT_TRIPLE_SOURCE` defaults to 'tdbContentTripleSource'.  Will use
   an external source if `FUSEKI_ENDPOINT` is set.
 - `FUSEKI_ENDPOINT = http://admin:vivo@fuseki:3030/vivo/` If set will use an
   external fuseki endpoint

# VIVO Dockerfile

This file builds and runs the main vivo application.

# Configuration

The `applicationSetup.n3` and `runtime.properties` files are templates. `/docker-entrypoint.sh` replaces environmental variable
names inside `applicationSetup.n3` and `runtime.properties` before
running.

## Variables

 - `VIVO_SOLR_HOSTNAME` Solr host name in docker-compose
 - `VIVO_CONTENT_TRIPLE_SOURCE` defaults to 'tdbContentTripleSource'.  To use Fueski, switch to sparqlContentTripleSource
 - `FUSEKI_HOSTNAME`
 - `FUSEKI_USERNAME`
 - `FUSEKI_PASSWORD`
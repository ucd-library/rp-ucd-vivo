ARG SCHOLARS_DISCOVERY_IMAGE_NAME
ARG SCHOLARS_DISCOVERY_REPO_TAG
FROM ucdlib/${SCHOLARS_DISCOVERY_IMAGE_NAME}:${SCHOLARS_DISCOVERY_REPO_TAG}

RUN apk update && apk add jq

COPY config.json /opt/discovery-config.json

CMD export SPRING_APPLICATION_JSON=$(jq \
    ".spring.data.solr.host = \"http://$DISCOVERY_SOLR_HOSTNAME:8983/solr\" | \
    .ui.url = \"$APP_URL\" | \
    .vivo[\"base-url\"] = \"$VIVO_BASE_URL\"" \
    /opt/discovery-config.json); \
    echo $SPRING_APPLICATION_JSON; \
    java -jar ./scholars-discovery.jar
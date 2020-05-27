ARG SCHOLARS_DISCOVERY_IMAGE_NAME
ARG SCHOLARS_DISCOVERY_REPO_TAG
FROM ucdlib/${SCHOLARS_DISCOVERY_IMAGE_NAME}:${SCHOLARS_DISCOVERY_REPO_TAG}

RUN apk update && apk add jq

COPY config.json /opt/discovery-config.json

CMD export SPRING_APPLICATION_JSON=$(less /opt/discovery-config.json | \
    jq ".mail.username = \"$GMAIL_USERNAME\" | .mail.password = \"$GMAIL_PASSWORD\""); \
    echo $SPRING_APPLICATION_JSON; \
    java -jar ./scholars-discovery.jar
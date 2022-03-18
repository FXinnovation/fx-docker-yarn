FROM alpine:3.9

VOLUME /data

ENV YARN_VERSION="1.15.2" \
    NODEJS_VERSION="10.14.2-r0" \
    CURL_VERSION="7.64.0-r1" \
    GNUPG_VERSION="2.2.12-r0" \
    BASH_VERSION="4.4.19-r1"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

WORKDIR /data

ENTRYPOINT ["/root/.yarn/bin/yarn"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="yarn" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.9" \
      "org.label-schema.description"="Yarn in a container" \
      "org.label-schema.url"="https://yarnpkg.com" \
      "org.label-schema.vcs-url"="https://github.com/FXinnovation/fx-docker-yarn" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.yarn.version"=$CHEFDK_VERSION \
      "org.label-schema.applications.nodejs.version"=$STOVE_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Please see README.md"

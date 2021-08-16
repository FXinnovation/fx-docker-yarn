FROM alpine:3.14.1

VOLUME /data

ENV YARN_VERSION="1.22.10-r0" \
    NODEJS_VERSION="14.17.4-r0" \
    CURL_VERSION="7.78.0-r0" \
    GNUPG_VERSION="2.2.27-r0" \
    BASH_VERSION="5.1.4-r0"

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
      "org.label-schema.base-image.version"="3.14.1" \
      "org.label-schema.description"="Yarn in a container" \
      "org.label-schema.url"="https://yarnpkg.com" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-yarn" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.yarn.version"=$CHEFDK_VERSION \
      "org.label-schema.applications.nodejs.version"=$STOVE_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Please see README.md"

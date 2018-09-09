ARG BASE_IMAGE=ruby:2.5.1-alpine
FROM $BASE_IMAGE

ARG TAG=1
ARG DOCKER_IMAGE=traviscli

ENV TAG=${TAG}
ENV DOCKER_IMAGE=${DOCKER_IMAGE}

RUN echo "Working on ${DOCKER_IMAGE}:${TAG}"
RUN echo "Installing git and travis cli"   \
    && mkdir /workspace                    \
    && apk add --no-cache git              \
    && apk add --no-cache bash             \
    && apk add --no-cache build-base       \
    && gem install travis                  \
    && apk del build-base

RUN echo "Setting up travis user"          \
    && addgroup -S travis -g 1999          \
    && adduser -S -g travis -u 1999 travis

COPY entrypoint.sh /bin/entrypoint
COPY travis_profile.sh /etc/profile.d/travis_profile.sh
RUN chmod +x /bin/entrypoint
RUN /bin/entrypoint test

WORKDIR /workspace

USER travis

ENTRYPOINT ["/bin/entrypoint"]

# Description: A lightweight Shopify CLI container intended for CI, based on ruby:3-alpine
# Usage: docker build -t <tag> [--build-arg version=<version>]
ARG version=2.32.0

FROM ruby:3-alpine

RUN test -n "$version"
# Install deps for native gem installation, sudo and bash for the Shopify gem
RUN apk update && apk add --virtual build-dependencies build-base gcompat sudo bash npm
RUN gem install shopify-cli -v ${version}
RUN shopify reporting off

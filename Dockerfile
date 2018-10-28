FROM ruby:2.5.1-alpine3.7

WORKDIR /app

RUN apk -U upgrade \
 && apk add -t build-dependencies \
    build-base \
 && rm -rf /tmp/* /var/cache/apk/*

RUN apk -U upgrade \
 && apk add -t vips \
 && apk add -t vips-dev \
 && rm -rf /tmp/* /var/cache/apk/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /app


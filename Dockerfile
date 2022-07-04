FROM ruby:3.1.2-alpine

RUN apk add --update --virtual \
    runtime-deps \
    build-base \
    libxml2-dev \
    libxslt-dev \
    libpq-dev \
    pkgconfig \
    postgresql-dev \
    postgresql-client \
    nodejs \
    yarn \
    libffi-dev \
    git \
    tzdata

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle install
RUN yarn install

ENTRYPOINT [ "bin/rails" ]
CMD ["s", "-b", "0.0.0.0"]
EXPOSE 3000
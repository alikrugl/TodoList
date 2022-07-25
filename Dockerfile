FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client nodejs

WORKDIR /app
COPY . /app/

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler:2.3.16
RUN bundle install

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
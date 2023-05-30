FROM ruby:3.1.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /davedaftgoods
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
COPY Gemfile /davedaftgoods/Gemfile
COPY Gemfile.lock /davedaftgoods/Gemfile.lock
RUN bundle install
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

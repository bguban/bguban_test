FROM ruby:3.0.3
RUN apt-get update && \
    apt-get install -y libpq-dev postgresql-client libcurl4-openssl-dev --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

#ENV BUNDLER_VERSION 2.2.32
ENV APP_PATH /usr/src/app

#RUN mkdir -p $APP_PATH

#COPY Gemfile $APP_PATH
#COPY Gemfile.lock $APP_PATH

WORKDIR $APP_PATH
COPY . $APP_PATH

#RUN gem install bundler
#RUN bundle config set deployment 'true'
RUN bundle config set --global path $APP_PATH/vendor/bundle
RUN bundle install --jobs $(nproc)

CMD ["bundle", "exec", "rails","server","-b","0.0.0.0","-p","3000"]

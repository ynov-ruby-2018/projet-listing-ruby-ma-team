FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Create working directory
RUN mkdir -p /data/app
WORKDIR /data/app

# Run bundle install.
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . .

# Add a script to be executed every time the container starts.
COPY docker-ruby-entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

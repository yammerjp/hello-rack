FROM rubylang/ruby:2.6.8-bionic
WORKDIR /home/ubuntu
COPY . .
RUN bundle install
EXPOSE 9292
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]


#!/usr/bin/env bash
# exit on error
set -o errexit


bundle install
RAILS_ENV=production rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

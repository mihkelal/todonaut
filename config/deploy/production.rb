# frozen_string_literal: true

set :branch, 'google-cloud'
server '35.209.187.212', user: fetch(:user), roles: %i[web app db], primary: true

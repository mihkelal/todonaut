# frozen_string_literal: true

server '104.248.95.67', user: fetch(:user), roles: %i[web app db], primary: true

# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'es_modules'

pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@rails/activestorage', to: 'activestorage.esm.js'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'

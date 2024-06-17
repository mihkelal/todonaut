# Todonaut

Note manager with rich text editing and file uploading function.

## Overview

Todonaut is a Ruby on Rails application with a small set of features that allows users to create and manage notes.

In 2018 the app started off using Rails 5, ruby 2.5, Webpacker and Capistrano. It has been constantly updated ever since, introducing new Rails ecosystem features and updating the stack to the latest versions.

It now uses Rails 7, ruby 3.3, Import maps and Kamal.

## Stack, tools, libraries used
* [Ruby on Rails](https://rubyonrails.org)
* [Import maps](https://github.com/rails/importmap-rails) for importing JavaScript modules
* [Sprockets](https://guides.rubyonrails.org/asset_pipeline.html) for compiling assets
* [Tailwind CSS](https://tailwindcss.com/) for frontentd CSS classes using a utility-first CSS framework
* [Turbo](https://github.com/hotwired/turbo-rails) (from [Hotwire](https://hotwired.dev)) for the speed of an SPA without having to write any JavaScript
* [Active Storage](https://guides.rubyonrails.org/active_storage_overview.html) for uploading files to Google Cloud Storage
* [Action Text](https://guides.rubyonrails.org/action_text_overview.html) for rich text content and editing
* [Kamal](https://kamal-deploy.org) for deploying to cloud VM
* PostgreSQL as database
* reCAPTCHA for protection from fraud and abuse

## Prerequisites

Before you begin, ensure you have installed the following on your machine:
* `ruby` version `3.3.2`
* `PostgreSQL`

## Installing

```shell
bin/setup
```

This installs the necessary gems and sets up the database.

## Usage

Start the puma server, which also starts the Tailwind CSS build watcher:
```shell
rails s
```

## Contact

If you want to contact me you can reach me at <mihkelal@gmail.com>.

## License

This project uses the [MIT](https://opensource.org/licenses/MIT) license.

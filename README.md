# Todonaut

Note manager with rich text editing and file uploading function.

## Stack, tools, libraries used
* [Ruby on Rails](https://rubyonrails.org/)
* [Import maps](https://github.com/rails/importmap-rails) for importing JavaScript modules
* [Sprockets](https://guides.rubyonrails.org/asset_pipeline.html) for compiling assets
* [Turbo](https://github.com/hotwired/turbo-rails) (from [Hotwire](https://hotwired.dev/)) for the speed of an SPA without having to write any JavaScript
* PostgreSQL as database
* reCAPTCHA for protection from fraud and abuse

## Prerequisites

Before you begin, ensure you have installed the following on your machine:
* `ruby` version `3.2.2`
* `nodeJS`
* `yarn`
* `PostgreSQL`

## Installing

```shell
bin/setup
```

This installs the necessary gems and sets up the database.

## Usage

Start the puma server and the Tailwind CSS build watcher:
```shell
rails s
```
```shell
rails tailwindcss:watch
```

Alternatively, run both in the same shell with foreman:
```shell
bin/dev
```

## Contact

If you want to contact me you can reach me at <mihkel.alavere@eesti.ee>.

## License

This project uses the [MIT](https://opensource.org/licenses/MIT) license.

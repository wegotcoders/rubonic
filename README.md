# Rubonic

Rake scripts to automate cordova development.

Rubonic allows you to package and run your HTML5 web apps in a web view with cordova.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubonic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubonic


### Requirements

Install cordova with `npm install cordova`

On a mac, you will need Xcode and the [Xcode command line tools installed](https://developer.apple.com/library/mac/recipes/xcode_help-locations_preferences/SpecifyingCommandLineTools/SpecifyingCommandLineTools.html) to deploy to iOS.

For android you will need the [android sdk](http://www.androidcentral.com/installing-android-sdk-windows-mac-and-linux-tutorial#slide2).


Rubonic will give you the following rake tasks.

```
rake rubonic:android:build            # Builds android app into the CONFIG_FILE (defaults to build...
rake rubonic:android:rebuild_and_run  # Builds & runs android app
rake rubonic:android:run              # Runs android app
rake rubonic:build:clean              # Blats the build_Dir in the CONFIG_FILE (defaults to build....
rake rubonic:ios:build                # Builds ios app into the CONFIG_FILE (defaults to build.yml)
rake rubonic:ios:rebuild_and_run      # Rebuilds and runs ios app in Xcode
rake rubonic:ios:run                  # Runs ios app in Xcode
```


### Generating a Padrino project from a template

`padrino g project test_proj --template <INSERT TEMPLATE URL HERE>`

This will generate a padrino project with a `mobile` and `api` sub apps and a `build` directory for the rake tasks.

During development you can run `padrino start` and preview the app in [http://localhost:3000/mobile](http://localhost:3000/mobile)

The `api` sub app is there if you want to create a backend for the mobile app.

The project template also imports angular and framework7.

To add assets, change the `config/assets.yml`.

The project template uses rspec, activerecord, haml and scsss, change this as per your needs.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rubonic. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


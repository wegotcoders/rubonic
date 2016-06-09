
# # my_template.rb
project :test              => :rspec,
        :orm               => :activerecord,
        :renderer          => :haml,
        :§sheet        => :scss,
        :migration_format  => :timestamp

# # generate :model, "post title:string body:text"
# # generate :model, "user name:string address:string post_code:string"
# # generate :controller, "posts get:index get:new post:new"
# # generate :migration, "AddEmailToUser email:string"
# # require_dependencies 'nokogiri'

generate :app, 'mobile'
generate :app, 'api'

empty_directory "public/fonts"
empty_directory "build"


rubonic_root_path = Gem::Specification.find_by_name('rubonic').gem_dir
rubonic_templates_path = "#{rubonic_root_path}/padrino_templates"

add_file 'config/assets.yml', File.read("#{rubonic_templates_path}/assets.yml")
add_file 'mobile/views/index.erb', File.read("#{rubonic_templates_path}/index.erb")
add_file 'config/rubonic.yml', File.read("#{rubonic_templates_path}/rubonic.yml")

inject_into_file "Gemfile", "gem 'rubonic'", :after => "source 'https://rubygems.org'\n"
inject_into_file "Rakefile", "require 'rubonic'", :after => "require 'padrino-core/cli/rake'\n"
inject_into_file "Rakefile", "require 'rubonic/tasks'\n", :after => "require 'rubonic'\n"
inject_into_file "mobile/app.rb", File.read("#{rubonic_templates_path}/app.rb"),
                :after => "enable :sessions\n"
prepend_file "mobile/app.rb", "require 'padrino-helpers'\n"


# Create NPM's package.json
package = <<-PACKAGE
{
  "name": "app",
  "version": "0.0.1",
  "dependencies": {
    "bower": "*"
  }
}
PACKAGE
create_file 'package.json', package

# Create bower.json
bower = <<-BOWER
{
  "name": "app",
  "license": "MIT",
  "ignore": [
    "**/.*",
    "node_modules",
    "bower_components",
    "test",
    "tests"
  ],
  "dependencies": {
    "angular": "^1.5.6",
    "angular-mocks": "^1.5.6",
    "angular-ui-router": "^0.3.1",
    "Framework7": "framework7#^1.4.2"
  }
}
BOWER
create_file 'bower.json', bower

# Install the libraries specified in package.json and bower.json

system "cd #{destination_root} && npm install"
system "cd #{destination_root} && ./node_modules/bower/bin/bower install --save"

require 'fileutils'

public_js_directory   = File.join(destination_root, 'public/javascripts')
public_css_directory  = File.join(destination_root, 'public/stylesheets')
bower_framework7_path = File.join(destination_root, 'bower_components/Framework7/dist')

FileUtils.cp "#{destination_root}/bower_components/angular/angular.js", "#{public_js_directory}"
FileUtils.cp "#{destination_root}/bower_components/angular-ui-router/release/angular-ui-router.js", "#{public_js_directory}"
FileUtils.cp "#{bower_framework7_path}/js/framework7.js", "#{public_js_directory}"
FileUtils.cp "#{bower_framework7_path}/js/my-app.js", "#{public_js_directory}"
FileUtils.cp "#{bower_framework7_path}/css/framework7.ios.css", "#{public_css_directory}"
FileUtils.cp "#{bower_framework7_path}/css/framework7.ios.colors.css", "#{public_css_directory}"
FileUtils.cp "#{bower_framework7_path}/css/framework7.ios.rtl.css", "#{public_css_directory}"
FileUtils.cp "#{bower_framework7_path}/css/framework7.material.css", "#{public_css_directory}"
FileUtils.cp "#{bower_framework7_path}/css/framework7.material.colors.css", "#{public_css_directory}"
FileUtils.cp "#{bower_framework7_path}/css/framework7.material.rtl.css", "#{public_css_directory}"

git :init

# Ignore npm/bower specific stuff
ignore = <<-IGNORE
node_modules/
bower_components/
IGNORE
append_file '.gitignore', ignore

# run 'bundle'
# bundle
# rake ""

# git :init

# # inject_into_file "models/post.rb","#Hello", :after => "end\n"
# # inject_into_file "models/user.rb", :after => "end\n" do <<-'RUBY'

# # def HelloWorld(message)
# #   "Message: #{message}"
# # end

# # RUBY
# # end

# # rake "ar:create ar:migrate"
# # initializer :test, "# Example"

# # app :testapp do
# #   generate :controller, "users get:index"
# # end

# # git :add, "."
# # git :commit, "-m 'second commit'"

# # my_template.rb
project :test              => :rspec,
        :orm               => :activerecord,
        :renderer          => :haml,
        :stylesheet        => :scss,
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

# add_file 'mobile/app.rb' do
# <<-APP
#   require 'jammit-sinatra'
#   require 'padrino-helpers'

#   module
# APP
# end File.read("#{rubonic_templates_path}/app.rb"), force: true

add_file 'config/assets.yml', File.read("#{rubonic_templates_path}/assets.yml")
add_file 'mobile/views/index.erb', File.read("#{rubonic_templates_path}/index.erb")
add_file 'config/rubonic.yml', File.read("#{rubonic_templates_path}/rubonic.yml")

inject_into_file "Gemfile", "gem 'rubonic'", :after => "source 'https://rubygems.org'\n"
inject_into_file "Rakefile", "require 'rubonic'", :after => "require 'padrino-core/cli/rake'\n"
inject_into_file "Rakefile", "require 'rubonic/tasks'\n", :after => "require 'rubonic'\n"
inject_into_file "mobile/app.rb", File.read("#{rubonic_templates_path}/app.rb"),
                :after => "enable :sessions\n"
prepend_file "mobile/app.rb", "require 'padrino-helpers'\n"



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

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

# mkdir :build

require 'pry'
binding.pry

rubonic_root_path = Gem::Specification.find_by_name('rubonic').gem_dir

add_file 'mobile/app.rb', File.open("#{rubonic_root_path}/padrino_templates/app.rb", 'r').read

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
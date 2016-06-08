module Rubonic::Build
  class Ios < BuildTemplate
    class << self
      def create_cordova_project(*args)
        execute sprintf("create %s %s %s", config[:build_dir],  config[:package_name], @config[:app_name])
      end

      def cordova_package(*args)

      end

      def run(*args)
        execute "open #{build_dir.path}/#{config[:app_name]}.xcodeproj"
      end
    end
  end
end
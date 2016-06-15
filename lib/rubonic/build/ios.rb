module Rubonic::Build
  class Ios < BuildTemplate
    class << self
      def create_cordova_project(*args)
        execute sprintf("cordova create %s %s %s", build_dir.path,  config[:package_name], @config[:app_name])
      end

      def cordova_package(*args)

      end

      def run(*args)
        execute "cd #{build_dir.path} && cordova run ios --nobuild"
      end
    end
  end
end
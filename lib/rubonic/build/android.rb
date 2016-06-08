module Rubonic::Build
  class Android < BuildTemplate
    class << self
      def create_cordova_project(*args)
        execute sprintf("cordova create %s %s %s", config[:build_dir],  config[:package_name], @config[:app_name])
        execute sprintf("cd %s && cordova platform add android", config[:build_dir])
      end

      def cordova_package(*args)
        execute sprintf("cd %s && cordova build", config[:build_dir])
      end

      def run(*args)
        execute "cd #{config[:build_dir]} && cordova run --nobuild"
      end
    end
  end
end
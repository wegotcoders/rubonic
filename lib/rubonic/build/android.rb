module Rubonic::Build
  class Android < BuildTemplate
    class << self
      def create_cordova_project(*args)
        execute sprintf("cordova create %s %s %s", build_dir.path,  config[:package_name], @config[:app_name])
        execute sprintf("cd %s && cordova platform add android", build_dir.path)
      end

      def cordova_package(*args)
        execute sprintf("cd %s && cordova build", build_dir.path)
      end

      def run(*args)
        execute "cd #{build_dir.path} && cordova run --nobuild"
      end
    end
  end
end
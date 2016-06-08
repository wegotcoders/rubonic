require 'fileutils'
require 'erb'
require 'jammit'

module Rubonic::Build
  class BuildTemplate
    class << self

      def build(*args)
        begin
          test_create_command
          clean
          create_cordova_project
          jammit_package_assets
          build_index_html
          copy_assets_into_build_dir
          cordova_package
        rescue Exception => e
          puts e.message
          puts e.backtrace.join "\n"
        end
      end

      def run(*args)
        raise Exception.new("implement me!")
      end

      def clean
        FileUtils.rm_r build_dir.path
      end

      protected

      def create_cordova_project(*args)
        raise Exception.new("implement me!")
      end

      def cordova_package(*args)
        raise Exception.new("implement me!")
      end

      def config
        @config ||= YAML.load_file(ENV['CONFIG_FILE'] || "config/rubonic.yml")
      end

      def build_dir
        unless Dir.exist?(config[:build_dir])
          FileUtils.mkdir_p config[:build_dir]
        end

        @build_dir ||= Dir.new(config[:build_dir])
      end

      def test_create_command
        result = create_cordova_project rescue
        unless result
          raise Exception.new("Could not find the cordova (or create) executable. Is it on your PATH?")
        end
      end

      def jammit_package_assets
        Jammit.package!
      end

      def build_index_html
        # TODO - This api_host needs to be where the api lives in production
        Struct.new("Settings", :api_host)
        settings = Struct::Settings.new(config[:api_host])
        template = ERB.new(File.read('mobile/views/index.erb'))

        def include_stylesheets(*args)
          '<link href="css/common.css" type="text/css" rel="stylesheet" />'
        end

        def include_javascripts(*args)
          '<script type="text/javascript" src="js/application.js"></script>'
        end

        File.open('public/index.html', 'w') { |f| f.write(template.result binding) }
      end

      def copy_assets_into_build_dir
        FileUtils.cp_r 'public/images/.', File.join(build_dir.path, 'www', 'img')
        FileUtils.cp 'public/assets/common.css', File.join(build_dir.path, 'www', 'css')
        FileUtils.cp 'public/assets/application.js', File.join(build_dir.path, 'www', 'js')
        FileUtils.cp_r 'public/fonts/.', File.join(build_dir.path, 'www', 'fonts')
        FileUtils.cp 'public/index.html', File.join(build_dir.path, 'www')
      end

      private
      def execute(cmd)
        puts cmd
        `#{cmd}`
      end
    end
  end
end
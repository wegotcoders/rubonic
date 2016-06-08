require 'rubonic/build/build_template'
require 'rubonic/build/android'
require 'rubonic/build/ios'

namespace :rubonic do

  namespace :build do
    desc 'Blats the build_Dir in the CONFIG_FILE (defaults to build.yml)'
    task :clean do
      Rubonic::Build::BuildTemplate.clean
    end
  end

  namespace :android do
    desc 'Builds android app into the CONFIG_FILE (defaults to build.yml)'
    task :build do
      Rubonic::Build::Android.build
    end

    desc 'Runs android app'
    task :run do
      Rubonic::Build::Android.run
    end

    desc 'Builds & runs android app'
    task :rebuild_and_run => :build do
      Rubonic::Build::Android.run
    end
  end

  namespace :ios do
    desc 'Builds ios app into the CONFIG_FILE (defaults to build.yml)'
    task :build do
      Rubonic::Build::Ios.build
    end

    desc 'Runs ios app in Xcode'
    task :run do
      Rubonic::Build::Ios.run
    end

    desc 'Rebuilds and runs ios app in Xcode'
    task :rebuild_and_run => :build do
      Rubonic::Build::Ios.run
    end
  end
end


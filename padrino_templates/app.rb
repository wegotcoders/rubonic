
    register Jammit

    configure do
      ::RAILS_ENV = "development" # this is needed to work around a Jammit limitation
      Jammit.load_configuration("config/assets.yml")
    end

    configure :development, :test do
      set :api_host, 'http://localhost:3000'
    end

    configure :development do
      set :frontend_host, "http://localhost:4567"
    end

    configure :test do
      set :frontend_host, "http://localhost:8888"
    end

    configure :production do
      set :frontend_host, "http://techlog-frontend.herokuapp.com"
      set :api_host, 'https://techlog-api.herokuapp.com'
    end

    get '/' do
      erb :index
    end

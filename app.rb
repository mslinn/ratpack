require 'sinatra/activerecord'
require 'sinatra/base'
require 'sqlite3'

Dir.glob('./lib/*.rb').sort.each { |model| require model }

module Ratpack
  class App < Sinatra::Base
    configure do
      set :root, File.dirname(__FILE__)
    end

    set :database, "sqlite3:///database.db"

    get '/' do
      erb :index
    end

    helpers do
      def partial(file_name)
        erb file_name, layout: false
      end
    end
  end
end

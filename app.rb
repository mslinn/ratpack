require 'sinatra/activerecord'
require 'sinatra/base'
require 'sqlite3'

Dir.glob('./lib/model/*.rb').sort.each { |model| require model }

module Ratpack
  class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure do
      set :root, File.dirname(__FILE__)
    end

    set :database, {adapter: "sqlite3", database: "database.sqlite3"}

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

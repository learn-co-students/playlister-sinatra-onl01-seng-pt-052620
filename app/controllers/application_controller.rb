class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, 'app/views'
  set :database, {adapter: "sqlite3", database: "db/development.sqlite3"}

  get '/' do
    erb :index
  end
end
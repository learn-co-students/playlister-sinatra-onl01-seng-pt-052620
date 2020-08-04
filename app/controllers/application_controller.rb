class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "some string that will make a good encryption probably"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end
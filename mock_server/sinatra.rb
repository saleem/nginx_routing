require 'sinatra'

get '/guideme' do
  redirect 'http://www.google.com'
end

get '/routeme' do
  redirect request.env["HTTP_X_MYTOKEN"]
end

get '/:name' do
  'Hallo, Welt!'
  "You accessed the url \"#{params['name']}\""
  "Some of your headers are below:"
  request.env["HTTP_X_MYTOKEN"]
end

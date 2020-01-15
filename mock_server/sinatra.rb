require 'sinatra'

get '/*' do
  redirect request.env["HTTP_X_MYTOKEN"]
end


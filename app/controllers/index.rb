get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/info' do
  Demo.new(self).info
end

get '/login' do
	redirect to get_uri
end

get '/oauth2callback' do
	token = oauth_client.auth_code.get_token(
    params[:code],
    :redirect_uri => 'http://http://still-sands-7594.herokuapp.com/oauth2callback'
  )
  response = token.get 'https://www.googleapis.com/oauth2/v1/userinfo?alt=json'
  @user_info = JSON.parse(response.body)

  erb :index
end



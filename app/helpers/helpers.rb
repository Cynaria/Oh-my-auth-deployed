helpers do
	def get_uri
		uri = oauth_client.auth_code.authorize_url(
			:redirect_uri => 'http://localhost:9393/oauth2callback', # <-- your redirect URI
			:scope => 'https://www.googleapis.com/auth/plus.login' # <-- determined by reading the Google OAuth2 docs
			)
	end

	def oauth_client
  @client ||= OAuth2::Client.new(
	    ENV['GOOGLE_CLIENT_ID'],
	    ENV['GOOGLE_CLIENT_SECRET'],
	    :site => 'https://accounts.google.com',
      :token_url => '/o/oauth2/token',
      :authorize_url => '/o/oauth2/auth'
    )
	end

end
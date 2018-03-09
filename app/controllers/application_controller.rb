class ApplicationController < ActionController::Base
	require "net/http"
	require "uri"
  protect_from_forgery with: :exception
  before_action :add_bnet_token

  def after_sign_in_path_for(resource)
  	account_path
  end

  protected

  def add_bnet_token
  	unless session[:bnet_token]
			secret = Rails.application.secrets.bnet_secret
			client_id = Rails.application.secrets.bnet_client_id
			grant_type = 'client_credentials'
			url = URI("https://eu.battle.net/oauth/token?grant_type=#{grant_type}&client_id=#{client_id}&client_secret=#{secret}")
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			request = Net::HTTP::Post.new(url)
			response = http.request(request)
			token = JSON.parse(response.read_body)['access_token']
			session[:bnet_token] ||= token
		end
		#current_user.update_attributes(token: token) if current_user?
	end


end

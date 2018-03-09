Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :bnet, Rails.application.secrets.bnet_client_id, Rails.application.secrets.bnet_secret
end
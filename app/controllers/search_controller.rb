class SearchController < ApplicationController
	before_action :authenticate_user!

	def search_character
		
	end

	def get_realm_list
		token = session[:bnet_token]
		namespace = namespace(params[:region])

		response = open_uri(
			build_uri(
				region_host(params[:region]),
				locale(params[:region]),
				session[:bnet_token],
				namespace,
				'/data/wow/realm/'
			)
		)
		@realms = get_clear_realms_list( parse_response_body(response) )
		respond_to do |format|
			format.json
		end
	end

	def region_host(region)
		"https://#{region}.api.battle.net/"
	end

	def locale(region)
		case region
		when 'us'
			"en_US"
		when 'eu'
			"en_GB"
		end
	end

	def auth_callback
		
	end

	def open_uri(uri)
		Net::HTTP.get(uri)
	end

	def build_uri(base_url, locale, token, namespace, url)
		uri = base_url + url 
		uri += "?"
		uri += "namespace=#{namespace}&locale=#{locale}&access_token=#{token}"
		URI(uri)
	end

	def namespace(region)
		'dynamic-' + region
	end

	def parse_response_body(response)
		JSON.parse(response)
	end

	def get_clear_realms_list(response)
		response['realms'].map {|r| [r['name'], r['slug']] }
	end
end
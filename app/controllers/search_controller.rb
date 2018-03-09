class SearchController < ApplicationController

	def search_character
		
	end

	def get_realm_list
		@token = bnet_auth
		url = region_host(params[:region]) + "data/wow/realm/?namespace=#{namespace}&access_token=#{@token}"
		# "https://#{region}.api.battle.net/data/wow/realm?namespace=dynamic-eu&access_token=#{@token}" 
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
		Net::HTML.get(uri)
	end

	def build_uri(base_url, locale, token, namespace, url)
		uri = base_url + url 
		uri += "?"
		uri += "namespace=#{namespace}&locale=#{locale}&token=#{token}"
		URI(uri)
	end

	def namespace(region)
		'dynamic-' + region
	end
end
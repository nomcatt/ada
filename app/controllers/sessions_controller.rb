require 'bungie_client'

BungieClient::Service.services.merge YAML.load_file(File.join(Rails.root, 'config', 'new_bungie_services.yml') || {})

class SessionsController < ApplicationController
    def new
      render :new
    end
  
    def create
      user_info = request.env['omniauth.auth']
      @user_name = user_info.info.unique_name

      client = BungieClient::Wrapper.new api_key: ENV['BUNGIE_API_KEY'], token: user_info.credentials.token

      puts 'start'
      # puts client.search_destiny_player :membershipType => '2', :displayName => 'RuBAN-GT'
      puts client.search_destiny_entities searchTerm: 'sunshot', type: 'DestinyInventoryItemDefinition', page: 0
      puts 'end'
      
      #right now this will just send you back to the login page.
      #user_info should contain the info bungie gave back about
      # the login. You can read about how omniauth organizes that
      # info here: https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema. I think you will need the oauth token to 
      # access the bungie api on behalf of this user.
      render :logged_in
    end
  end
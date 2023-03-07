Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    
    #for RuBAN omniauth/bungie strategy
    provider :bungie, 
             ENV['BUNGIE_CLIENT_ID'], 
             ENV['BUNGIE_CLIENT_SECRET'], 
             ENV['BUNGIE_API_KEY'],
             ENV['BUNGIE_CALLBACK_URL']
end
Rails.application.routes.draw do
  get '/ukrnet_rss(/:filter)' => 'ukrnet_rss/rss_items#index'
end

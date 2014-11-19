Rails.application.routes.draw do
  get '/ukrnet_rss' => 'ukrnet_rss/rss_items#index'
end

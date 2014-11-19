Rails.application.routes.draw do
  get '/ukrnet_rss' => 'ukrnet_rss/posts#index'
end

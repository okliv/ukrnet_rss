Rails.application.routes.draw do
  get '/ukrnet_rss(/:filter)' => 'ukrnet_rss/posts#index'
end

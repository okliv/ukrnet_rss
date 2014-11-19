Rails.application.routes.draw do
  get '/ukrnet_rss(/:filter)' => 'ukrnet_rss/posts#index'
  get '/yandex_rss' => 'yandex_rss/rss_items#index'
end

module UkrnetRss
  class RssItemsController < ApplicationController

    layout false

    def index
      @channel = UkrnetRss.channel
      @posts = UkrnetRss.posts(params[:filter])
      render :template => 'ukrnet_rss/rss_items/index.rss.builder'
    end
  end
end

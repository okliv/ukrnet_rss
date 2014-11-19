module UkrnetRss
  class PostsController < ApplicationController

    layout false

    def index
      @channel = UkrnetRss.channel
      @posts = UkrnetRss.posts(params[:filter])
      render :template => 'ukrnet_rss/posts/index.rss.builder'
    end
  end
end

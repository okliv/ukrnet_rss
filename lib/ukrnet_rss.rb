require 'ukrnet_rss/version'
require 'ukrnet_rss/railtie' if defined?(Rails)
require 'ukrnet_rss/active_record_extension'
require 'ukrnet_rss/engine'

module UkrnetRss
  include ActiveRecordExtension
  mattr_accessor :config
  mattr_accessor :resource

  TOTAL = 20
  MAX_TOTAL = 100

  def self.rss_structure
    {attributes: [:title, :link, :description, :author, :category, :pub_date, :full_text, :news_image],
     assets: [:url, :is_video]
    }
  end

  def self.channel
    config[:channel]
  end

  def self.total
    config[:total].to_i<MAX_TOTAL&&config[:total].to_i>0 ? config[:total].to_i : TOTAL
  end

  def self.posts(filter=nil)
    self.resource.posts_for_ukrnet_rss(filter)
  end

end

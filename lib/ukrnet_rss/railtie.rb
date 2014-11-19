module UkrnetRss
  class Railtie < Rails::Railtie
    # for example, if you want to extend ViewHelpers
    initializer 'ukrnet_rss.active_record_extension' do
      ActiveRecord::Base.send(:include, ActiveRecordExtension)
    end
  end
end

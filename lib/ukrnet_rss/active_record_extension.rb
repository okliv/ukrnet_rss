module ActiveRecordExtension

  # Your code goes here...
  extend ActiveSupport::Concern

  # add your instance methods here
  #
  #

  # add your static(class) methods here
  module ClassMethods
    def ukrnet_rss(hsh)
      UkrnetRss.config = hsh
      UkrnetRss.resource = self
    end

    def posts_for_ukrnet_rss(filter=nil)
      res = []
      UkrnetRss.resource.filter_for_ukrnet(filter.split('-').presence).limit(UkrnetRss.total).map do |post|
        subres = {}
        UkrnetRss.rss_structure.each do |attr, inner_attrs|
          if attr==:attributes
            inner_attrs.each do |inner_attr|
              existing_attr = UkrnetRss.config[:attributes][inner_attr]
              subres[inner_attr] = existing_attr.presence&&post.respond_to?(existing_attr) ? post.send(existing_attr) : ''
            end
          else
            collection_method = UkrnetRss.config[attr][:collection_method]
            if collection_method.presence&&post.respond_to?(collection_method)
              subres[attr] ||= []
              with_attributes = []
              post.send(UkrnetRss.config[attr][:collection_method]).to_a.each do |item|
                inner_attrs.each do |inner_attr|
                  with_attributes << UkrnetRss.config[attr][:collection_items_methods][inner_attr].presence
                end
                subres[attr] << item.attributes.slice(*(with_attributes.compact))
              end
            end
          end
        end
        res << subres
      end
      res
    end
  end

end

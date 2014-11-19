# UkrnetRss

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ukrnet_rss'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ukrnet_rss

## Usage

add this code to your model (set feed variables and map feed attributes)

```ruby
  ukrnet_rss total: 20, #optional, default 20, max 100
                         channel: {
                             title: 'Site title here',
                             link: 'Site url here',
                             description: 'Site description here',
                             image: {
                                 url: 'http://website.com/logo.png',
                                 title: 'Site title here',
                                 link: 'Site url here'
                             }
                         },
                         attributes: {
                             title: :name,
                             link: :path,
                             description: :body,
                             author: :username,
                             category: :section_name,
                             pub_date: :published_at,
                             genre: 'Horror',
                             news_image: :main_image,
                             full_text: :body_full},
                         assets: {
                             collection_method: :publication_pictures,
                             collection_items_methods: {
                                 url: :link,
                                 is_video: false #true or false - optional
                             }
                         },
                         related: {
                             collection_method: '',
                             collection_items_methods: {
                                 url: '',
                                 name: ''
                             }
                         }
```

go to the `/ukrnet_rss` path and see if you get what you need

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ukrnet_rss/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

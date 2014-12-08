xml.instruct! :xml, :version => '1.0', encoding: 'UTF-8'
xml.rss :version => '2.0', 'xmlns:yandex'=>'http://news.yandex.ru' do

  xml.channel do
    xml.language 'ru'
    xml.title @channel[:title]
    xml.link @channel[:link]
    xml.description @channel[:description]
    xml.image do
      xml.url @channel[:image][:url]
      xml.title @channel[:image][:title]
      xml.link @channel[:image][:link]
    end
    for post in @posts
      xml.item do
        xml.title post[:title]
        xml.link post[:link]
        xml.description post[:description]
        xml.author post[:author]
        xml.category post[:category]
        xml.news_image post[:news_image]
        for asset in post[:assets].to_a
          type = asset[:video] ? 'video/x-ms-asf' : 'image/jpeg'
          xml.enclosure url: asset[:url], type: type
        end
        xml.pubDate post[:pub_date] #'Sun, 29 Sep 2002 19:59:01 +0400'
        xml.send('yandex:full-text', post[:full_text])
      end
    end
  end

end

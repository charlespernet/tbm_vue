require 'nokogiri'

class Scrapper
  def process
    file      = File.open('storage/tbm_example.xml')
    document  = Nokogiri::XML(file)

    document.xpath('//bm:SV_ARRET_P').each do |beer|
      name        = beer.xpath('bm:LIBELLE').text
      theoric  = beer.xpath('bm:HOR_THEO').text
      app      = beer.xpath('bm:HOR_APP').text
      real      = beer.xpath('bm:HOR_REAL').text
      puts "#{name} #{theoric} #{app} #{real}"
    end
  end

end

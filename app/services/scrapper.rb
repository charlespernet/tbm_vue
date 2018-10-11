require 'nokogiri'

class Scrapper
  def data_for_line(line)
    # lianes 1 = 1 / Lianes 5 = 6
    @data ||= process
    @data.select { |bus| bus[:line] == line }
  end

  private

  def process
    file      = File.open('storage/tbm_example.xml')
    document  = Nokogiri::XML(file)

    document.xpath('//bm:SV_ARRET_P').map do |stop|
      {
        line: stop.xpath('bm:RS_SV_LIGNE_A').text,
        name: stop.xpath('bm:LIBELLE').text,
        theoric: stop.xpath('bm:HOR_THEO').text,
        app: stop.xpath('bm:HOR_APP').text,
        real: stop.xpath('bm:HOR_REAL').text
      }
    end
  end
end

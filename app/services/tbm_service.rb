require 'nokogiri'
require 'open-uri'

class TbmService
  def initialize(attributes)
    @line = attributes[:line] || '1'
    @url = 'https://data.bordeaux-metropole.fr/wps?key=0239ADSUWY&service=WPS&version=1.0.0&request=Execute&Identifier=saeiv_arret_passages&DataInputs=GID=517'
    # @file = File.open('storage/tbm_example.xml')
    @file = get_xml_from_tbm
  end

  def data_for_line
    # lianes 1 = 1 / Lianes 5 = 6
    @data ||= process
    @data.select { |bus| bus[:line] == @line }
  end

  private

  def get_xml_from_tbm
    open(@url).read
  end

  def process
    document  = Nokogiri::XML(@file)

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

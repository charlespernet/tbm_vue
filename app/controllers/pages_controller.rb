class PagesController < ApplicationController
  def home
    @buses = TbmService.new(line: '1').data_for_line
  end
end

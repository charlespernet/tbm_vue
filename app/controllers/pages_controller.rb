class PagesController < ApplicationController
  def home
    @next_buses = TbmService.new(line: '1').data_for_line
  end
end

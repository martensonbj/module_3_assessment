class SearchesController < ApplicationController
  respond_to :json

  def index
    bbs = BestBuyService.new
    bbs.products(name)
  end

end

class SearchesController < ApplicationController
  respond_to :json

  def index
    bbs = BestBuyService.new
    @products = bbs.products(params[:search_params])
  end

end

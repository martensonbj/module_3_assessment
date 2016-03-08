class SearchesController < ApplicationController
  respond_to :json

  def index
    bbs = BestBuyService.new
    @products = bbs.products(params[:search_params])
    redirect_to search_path
  end

end

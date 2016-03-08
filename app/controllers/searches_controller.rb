class SearchesController < ApplicationController
  respond_to :json

  def index
    bbs = BestBuyService.new
    @products = bbs.products(params[:search_params])
    @single_products = bbs.single_product_data(params[:search_params])
  end

end

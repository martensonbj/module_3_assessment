class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def new
    binding.pry
    respond_with Product.new
  end

  def create
    respond_with  :api, :v1, Product.create!(item_params)
  end

  private

  def item_params
    params.permit( :name, :short_description, :image_url, :sku, :cusomer_review, :price)
  end

end

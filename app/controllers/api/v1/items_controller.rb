class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  def new
    respond_with Item.new
  end

  def create
    respond_with  :api, :v1, Item.create!(item_params)
  end

  private

  def item_params
    params.permit( :name, :description, :image_url)
  end

end

# respond_with :api, :v1, Skill.create(skill_params)

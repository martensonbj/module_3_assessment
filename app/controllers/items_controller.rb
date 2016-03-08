# class Api::V1::SkillsController < Api::V1::BaseController

class ItemsController < ApplicationController
  # respond_to :json

  def index
    @items = Item.all
    # respond_with Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end
end

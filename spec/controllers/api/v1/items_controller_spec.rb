require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  fixtures :items

  describe "GET index" do
    it "finds all items" do
      get :index, format: :json
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json_response[:items].count).to eq 4
      expect(json_response[:items].first).to include(:name)
      expect(json_response[:items].first).to include(:description)
      expect(json_response[:items].first).to include(:image_url)
      expect(json_response[:items].first).to_not include(:created_at)
      expect(json_response[:items].first).to_not include(:updated_at)
    end
  end

  describe "GET show" do
    it "finds a single item" do
      item = Item.first
      get :show, format: :json, id: item.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 1
      expect(json_response[:item]).to include(:name)
      expect(json_response[:item]).to include(:description)
      expect(json_response[:item]).to include(:image_url)
      expect(json_response[:item]).to_not include(:created_at)
      expect(json_response[:item]).to_not include(:updated_at)
    end
  end

end

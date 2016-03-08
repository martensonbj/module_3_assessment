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

  describe "DELETE destroy" do
    it "deletes an item" do
      item = Item.first
      get :show, format: :json, id: item.id

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      delete :destroy, format: :json, id: item.id
      expect(response).to have_http_status(204)
    end
  end

  describe "POST create" do
    it "creates an item" do
      item = Item.new(name: "Lambourghini Diablo", description: "Maybe if I ace this assessment I'll have on one day", image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
      item.save
      post :create, format: :json, id: item.id

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(json_response[:item][:name]).to eq("Lambourghini Diablo")
      expect(json_response[:item][:description]).to eq("Maybe if I ace this assessment I'll have on one day")
      expect(json_response[:item]).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=200x200")
      expect(json_response[:item]).to_not include(:created_at)
      expect(json_response[:item]).to_not include(:updated_at)
    end
  end

end

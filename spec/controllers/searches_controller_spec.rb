require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe "GET index" do

    it "shows items based on search criteria" do
      get :index, format: :json, search_params: "sennheiser"

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 2
      expect(json_response[:products].first).to include(:name)
      expect(json_response[:products].first).to include(:sku)
      expect(json_response[:products].first).to include(:customer_average_review)
      expect(json_response[:products].first).to include(:short_description)
      expect(json_response[:products].first).to include(:sale_price)
      expect(json_response[:products].first).to_not include(:image)
      expect(json_response[:products].first.count).to eq 4
    end

    it "shows items based on multiple words" do
      get :index, format: :json, search_params: "sennheiser headphones white"

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 2
      expect(json_response[:products].first).to include(:name)
      expect(json_response[:products].first).to include(:sku)
      expect(json_response[:products].first).to include(:customer_average_review)
      expect(json_response[:products].first).to include(:short_description)
      expect(json_response[:products].first).to include(:sale_price)
      expect(json_response[:products].first).to_not include(:image)
      expect(json_response[:products].first.count).to eq 4
    end

    it "returns error message with no results" do
      get :index, format: :json, search_params: "xdghowieht"
        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)
        expect(page).to have_text("Go Back")
    end

  end
end

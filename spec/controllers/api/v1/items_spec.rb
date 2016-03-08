require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET index" do
    it "finds all items" do
      get :index, format: :json

      binding.pry
      expect(response).to have_http_status(200)
      expect(json_response.count).to eq 500
      expect(json_response).to include(:name)
      expect(json_response).to include(:description)
      expect(json_response).to include(:image_url)
      expect(json_response).to not_include(:created_at)
      expect(json_response).to not_include(:updated_at)
    end
  end

end

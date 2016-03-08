require 'rails_helper'

RSpec.feature "root page", :type => :feature do
  scenario "it reaches the root page" do
    visit "/"

    expect(page.status_code).to eq(200)

    within 'h1' do
      expect(page).to have_text("Items")
    end
  end
end

require 'rails_helper'

RSpec.feature "search results", :type => :feature do
  scenario "it returns search results for one word" do
    visit root_path
    fill_in "search_params", with: "sennheiser"
    click_on "Search"
    expect(current_path).to eq search_path
    expect(page).to have_text('SEARCH RESULTS')
    expect(page).to have_css('.search-img', count: 15)
  end

  scenario "it returns search results for multiple word" do
    visit root_path
    fill_in "search_params", with: "sennheiser headphones white"
    click_on "Search"
    expect(current_path).to eq search_path
    expect(page).to have_text('SEARCH RESULTS')
    expect(page).to have_css('.search-img')
  end

  scenario "it returns an error message without search criteria" do
    visit root_path
    fill_in "search_params", with: "agsweatetest"
    click_on "Search"
    expect(current_path).to eq search_path
    expect(page).to have_text('SEARCH RESULTS')
    expect(page).to_not have_css('.search-table')
    expect(page).to have_text('There are no products currently available with that search critera.')
  end

  
end

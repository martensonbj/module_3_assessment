RSpec.describe "user can post and search with ajax", js: true do
  it "searches with a single search term" do
    visit search_path
    fill_in "search", with: "sennheiser"
    click_on "Search"

    expect(current_path).to eq search_path
    within '.search-results' do
      expect(page).to have_css('.item', count: 15)
    end
  end

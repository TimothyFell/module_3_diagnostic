require 'rails_helper'

describe "User can visit root page" do

  before(:each) do
    visit "/"

    within(".navbar") do
      fill_in 'q', with: '80203'
      click_on 'Locate'
    end
  end

  it "and search a zip code" do
    expect(current_path).to eq(search_path)
  end

  it 'after searching should see 10 closest fuel stations' do
    expect(page).to have_css('.station', count:10)
  end

  xit 'the search results should all be within 6 miles' do
    within('.station') do
      expect(station.distance).should be < 6
    end
  end

  xit 'the search resulsts should be sorted nearest to farthest' do

  end

  xit 'each station in the results should contain all relevant data' do


    within first('.station') do
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.address)
      expect(page).to have_content(station.fuel_type)
      expect(page).to have_content(station.distance)
      expect(page).to have_content(station.access_times)
    end
  end
end

require 'rails_helper'

describe "User can visit root page" do

  before(:each) do
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=80203&radius=6&fuel_type=ELEC,LPG&limit=10").
      to_return(body: File.read("./spec/fixtures/api_response_80203.json"))

    visit "/"

    within(".navbar") do
      fill_in 'q', with: '80203'
      click_on 'Locate'
    end
  end

  it "and search a zip code" do
    expect(current_path).to eq(search_path)
  end

  it 'after searching should see at most 10  of the closest fuel stations' do
    expect(page.all('.station').count).to be <= 10
  end

  it 'the search results should all be within 6 miles' do
    expect(page.all('.station > .distance').any? do |distance|
      distance > 6
    end).to eq(false)
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

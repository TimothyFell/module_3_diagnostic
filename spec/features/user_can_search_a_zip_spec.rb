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

  it 'each station in the results should contain all relevant data' do

    within first('.station') do
      expect(page).to have_content('UDR')
      expect(page).to have_content('800 Acoma St')
      expect(page).to have_content('Denver')
      expect(page).to have_content('CO')
      expect(page).to have_content('US')
      expect(page).to have_content('80204')
      expect(page).to have_content('0.31422')
      expect(page).to have_content('ELEC')
      expect(page).to have_content('24 hours daily')
    end
  end

  it 'the search results should all be within 6 miles and are sorted closest to farthest' do
    within all('.station').last do
      @last_distance = find('.distance').text.to_f
      expect(find('.distance').text.to_f).to be <= 6
    end
    within all('.station').first do
      @first_distance = find('.distance').text.to_f
      expect(find('.distance').text.to_f).to be <= 6
    end

    expect(@last_distance).to be > @first_distance
  end
end

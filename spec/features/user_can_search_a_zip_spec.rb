require 'rails_helper'

describe "User can visit root page" do

  it "and view navbar contents" do
    visit "/"

    within(".navbar") do
      fill_in 'q', with: '80203'
      click_on 'Locate'
    end

    expect(current_path).to eq()


  end

end

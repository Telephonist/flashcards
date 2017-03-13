require 'rails_helper'

RSpec.feature "Cards", type: :feature do

  before(:each) do
    create(:card).update(review_date: -3.days.from_now)
    visit root_path
  end

  feature "check card - false" do
    scenario "check card - false" do
      fill_in 'user_input', with: 'cow'
      find('input[type=submit]').click
      expect(page).to have_content "=("
    end
  end

  feature "check card - true" do
    scenario "check card - true" do
      fill_in 'user_input', with: 'reinbow'
      find('input[type=submit]').click
      expect(page).to have_content "=)"
    end
  end

end

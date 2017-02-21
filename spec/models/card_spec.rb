require 'rails_helper'

RSpec.describe Card, type: :model do

  before(:each) do
    @card = Card.create
  end

  it "check translation - false" do
  card = Card.new(original_text: "streik")
  expect(card.right_translation("battlestart")).to be false
  end

  it "check translation - true" do
    card = Card.new(original_text: "streik", translated_text: "strike")
    expect(card.right_translation("strike")).to be true
  end

  it "update review_date" do
    @card.update_review_date
    expect(@card.review_date.to_date).to eq(3.days.from_now.to_date)
  end

end

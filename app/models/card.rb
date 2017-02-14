# flashcards/app/models.card.rb;
class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, uniqueness: { message: "already exist" }
  validate :check_original_text_and_translated_text
  def check_original_text_and_translated_text
    errors.add(:translated_text, "не могут быть одинаковыми", case_) if original_text == translated_text
  end

  before_create do
    self.review_date = Date.today + 3.days
  end

  scope :for_review, -> { where("review_date <= ?", Date.today + 3.days) }
  scope :random, -> { order("RANDOM()") }
end

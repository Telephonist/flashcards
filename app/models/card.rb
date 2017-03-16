# flashcards/app/models.card.rb;
class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, uniqueness: { message: "already exist" }
  validate :check_original_text_and_translated_text
  def check_original_text_and_translated_text
    errors.add(:translated_text, "не могут быть одинаковыми") if original_text == translated_text
  end

  before_create do
    self.review_date = 3.days.from_now
  end

  scope :for_review, -> { where("review_date <= ?", 3.days.from_now).order("RANDOM()") }

  def right_translation(user_input)
    translated_text == user_input
  end

  def update_review_date
    update(review_date: 3.days.from_now)
  end
end

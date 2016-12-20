# flashcards/app/models.card.rb;
class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :original_text, format: { with: /\A[a-zA-Z]+\z/,
                                      message: "only allows letters" },
            uniqueness: { message: "already exist" }
  validates :translated_text, format: { with: /\A[а-яА-ЯёЁ]+\z/,
                                      message: "only allows letters" }
  validate :check_original_text_and_translated_text
  def check_original_text_and_translated_text
    errors.add(:translated_text, "не могут быть одинаковыми", case_) if original_text == translated_text
  end
  
  before_create do
    self.review_date = Date.today + 3.days
  end
end

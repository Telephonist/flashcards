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

  # def check_translate.scope
  #   Card.where("review_date <= Date.today", params[:revew_date])
  #   post translated_text if review_date <= Date.today
  # end
  #   scope :review_date, -> {where(review_date <= Date.today)}

end

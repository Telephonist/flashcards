# flashcards/db/migrate/201605173535_create_cards.rb;
class CreateCards < ActiveRecord::Migration[5.0]
  def up
    create_table :cards do |t|
      t.string :original_text
      t.string :translated_text
      t.timestamps :review_date
    end
  end

  def down
    drop_table :cards
  end
end

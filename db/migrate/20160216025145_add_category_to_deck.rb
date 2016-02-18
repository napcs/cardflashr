class AddCategoryToDeck < ActiveRecord::Migration
  def change
    add_reference :decks, :category, index: true
    add_foreign_key :decks, :categories
  end
end

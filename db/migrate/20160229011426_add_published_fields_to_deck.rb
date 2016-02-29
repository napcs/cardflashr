class AddPublishedFieldsToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :slug, :string
    add_column :decks, :published_at, :datetime
  end
end

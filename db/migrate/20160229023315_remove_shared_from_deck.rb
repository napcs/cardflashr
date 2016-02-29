class RemoveSharedFromDeck < ActiveRecord::Migration
  def change
    remove_column :decks, :shared, :boolean
  end
end

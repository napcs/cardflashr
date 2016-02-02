class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.text :description
      t.boolean :shared, default: false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :decks, :users
  end
end

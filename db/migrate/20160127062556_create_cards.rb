class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.text :question_text
      t.text :answer_text
      t.references :deck, index: true

      t.timestamps null: false
    end
    add_foreign_key :cards, :decks
  end
end

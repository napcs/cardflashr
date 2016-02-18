class AddDetailsToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :background_color, :string, default: "#333333"
    add_column :decks, :foreground_color, :string, default: "#FFFFFF"
    add_column :decks, :font_size, :string, default: "16pt"
    add_column :decks, :font, :string, default: "Arial"
  end
end

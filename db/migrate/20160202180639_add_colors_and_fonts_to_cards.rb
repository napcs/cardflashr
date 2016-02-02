class AddColorsAndFontsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :background_color, :string, default: "#333333"
    add_column :cards, :foreground_color, :string, default: "#FFFFFF"
    add_column :cards, :font_size, :string, default: "16pt"
    add_column :cards, :font, :string, default: "Arial"
  end
end

class AddAttachmentQuestionImageToCards < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.attachment :question_image
    end
  end

  def self.down
    remove_attachment :cards, :question_image
  end
end

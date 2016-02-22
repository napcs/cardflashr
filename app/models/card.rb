class Card < ActiveRecord::Base
  belongs_to :deck
  attr_reader :question_image_remote_url
  validates :name, presence: true
  has_attached_file :question_image, :remote => true,
    :styles => {
      :small  => "150x150>",
      :large => "1280x960>"
    },
    url: "/system/:hash.:extension",
    hash_secret: "a8234nasbbfjq2hn3fjasdk3j48!"

  before_post_process :check_file_size

  def avatar_remote_url=(url_value)
    self.question_image = URI.parse(url_value)
    @question_image_remote_url = url_value
  end

  private
    def check_file_size
      valid?
      errors[:question_image_file_size].blank?
    end
end

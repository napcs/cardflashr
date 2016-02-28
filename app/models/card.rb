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

  validates_attachment_content_type :question_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  before_post_process :check_file_size

  validates :question_text, presence: true, if: "question_image_file_name.nil?"

  # Download image from URL by passing
  # image url to Paperclip.
  def question_image_remote_url=(url_value)
    self.question_image = URI.parse(url_value)
    @question_image_remote_url = url_value
  end

  # Helper to fetch large image URL.
  # Returns nil if no image so that the "missing" image
  # isn't returned.
  # Method also used in Card#serializable_hash
  def question_large_image_url
    return nil unless self.question_image_updated_at
    self.question_image(:large)
  end

  # Override what Rails uses to serialize the object.
  def serializable_hash(options)
    {
      id: self.id,
      background_color: self.background_color,
      foreground_color: self.foreground_color,
      question_text: self.question_text,
      question_large_image_url: self.question_large_image_url,
      answer_text: self.answer_text,
      deck_id: self.deck_id,
      name: self.name,
      font: self.font,
      font_size: self.font_size }
  end

  private
    def check_file_size
      valid?
      errors[:question_image_file_size].blank?
    end
end

class Deck < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :cards, dependent: :destroy

  validates :name, presence: true

  validates :category_id, presence: { message: "must be filled in to share"}, if: "slug.present?"
  validates :description, presence: { message: "must be filled in to share"}, if: "slug.present?"

  scope :shared, -> { where("slug IS NOT NULL")}

  def shared
    self.slug.present?
  end

  # Mare a deck as shared by populating the "slug" attribute and
  # the shared at date
  # Does not modify the database. Explicitly call Note#save to do that.
  def share
    self.slug  = SecureRandom.urlsafe_base64
    self.published_at = Time.now
  end

  # Marks a deck as unshared by removing the "slug" attribute and the shared
  # at date.
  # Does not modify the database. Explicitly call Note#save to do that.
  def unshare
    self.slug = nil
    self.published_at = nil
  end


  def clone_to_user(user)
    new_deck = self.dup
    new_deck.user = user

    # Make sure new deck is not shared.
    new_deck.unshare
    new_deck.save

    self.cards.each do |card|
      new_card = card.dup
      new_card.deck = new_deck
      new_card.save
    end

    new_deck

  end

end

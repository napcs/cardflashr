class Deck < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :cards, dependent: :destroy

  validates :name, presence: true
end

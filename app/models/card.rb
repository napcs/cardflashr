class Card < ActiveRecord::Base
  belongs_to :deck
  validates :name, presence: true
end

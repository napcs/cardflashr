require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test "must have name" do
    card = Card.new
    card.valid?
    assert card.errors[:name].include? "can't be blank"
  end

  test "supports image attachment" do
    card = Card.new
    card.name = "rails"
    card.question_image = File.new("test/fixtures/rails.png")
    assert card.save
    assert_not_nil card.question_image_updated_at
  end

  test "supports image download from url" do
    url = "https://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png"
    card = Card.new
    card.name = "rails"
    card.question_image_remote_url = url
    assert card.save
    assert_not_nil card.question_image
  end

  test "if no image, must have question text" do
    card = Card.new
    card.name = "rails"
    card.valid?
    assert card.errors[:question_text].include?("can't be blank")
  end

  test "if image url then don't need question text" do
    url = "https://upload.wikimedia.org/wikipedia/commons/1/16/Ruby_on_Rails-logo.png"
    card = Card.new
    card.name = "rails"
    card.question_image_remote_url = url
    card.valid?
    assert !card.errors[:question_text].include?("can't be blank")
  end

end

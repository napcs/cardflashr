json.array!(@cards) do |card|
  json.extract! card, :id, :name, :question_text, :answer_text, :deck_id
  json.url card_url(card, format: :json)
end

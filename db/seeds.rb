# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#
u = User.create! email: "bphogan@gmail.com", password: "12345678", password_confirmation: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-02-16 03:17:49", last_sign_in_at: "2016-02-16 03:17:49", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-02-16 03:17:49", updated_at: "2016-02-16 03:17:49", provider: "facebook", uid: "10154455175912004"

Category.create name: "Math"
Category.create name: "IT"
Category.create name: "Writing"
Category.create name: "Engineering"
Category.create name: "Education"
Category.create name: "Medical"
category = Category.create name: "Science"

deck = u.decks.create name: "Biology", category: category
deck.cards.create name: "Natural selection", question_text: "Which famous scientist introduced the idea of natural selection?", answer_text: "Charles Darwin", background_color: "#333333", foreground_color: "#FFFFFF"
deck.cards.create name: "biologist", question_text: "What is a person who studies biology called?", answer_text: "A Biologist", background_color: "#333333", foreground_color: "#FFFFFF"
deck.cards.create name: "chromosomes", question_text: "How many chromosomes are in a human?", answer_text: "46. 23 from each parent", background_color: "#333333", foreground_color: "#FFFFFF"



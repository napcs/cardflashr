== CardFlashr

Create decks of flashcards and share them with others. Deck cards are shuffled
and can be flipped through using arrows or swiping gestures.

Built with Ruby 2.2, Rails 4.2 and React 0.14


## Setup

1. Clone the repository
2. Copy `config/secrets.yml.example` to `config/secrets.yml`
3. Create app on Twitter. Be sure to specify callback URL. Do **not use localhost**. Instead, use `http://0.0.0.0:3000/`
4. Create app on Facebook. Be sure to specify callback URL.
5. Edit `config/secrets.yml` and place keys in the appropriate spots
6. Run `bundle` to install dependencies
7. Create database with `rake db:setup`
8. Launch the app with `rails s -b 0.0.0.0`

## Running tests

Tests can be run with `rake test` or with `guard` for continuous testing.

## License

MIT. Copyright 2016 Brian P. Hogan

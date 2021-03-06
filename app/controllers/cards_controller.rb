class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deck
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :set_decks, only: [:new, :edit, :create, :update]

  # GET /cards
  # GET /cards.json
  def index
    @cards = @deck.cards.all
  end

  # GET /decks/1/cards/1
  # GET /decks/1/cards/1.json
  def show
  end

  # GET /decks/1/cards/new
  def new
    @card = @deck.cards.build background_color: @deck.background_color, foreground_color: @deck.foreground_color, font_size: @deck.font_size, font: @deck.font
  end

  # GET /decks/1/cards/1/edit
  def edit
  end

  # POST /decks/1/cards
  # POST /decks/1/cards.json
  def create
    @card = @deck.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to deck_cards_path(@deck), notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: [@deck, @card] }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decks/1/cards/1
  # PATCH/PUT /decks/1/cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to [@card.deck, @card], notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: [@card.deck, @card] }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to deck_cards_path(@deck), notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_deck
      @deck = current_user.decks.find(params[:deck_id])
    end

    def set_decks
      @decks = current_user.decks
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = @deck.cards.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name, :question_text, :question_image,
                                   :question_image_remote_url, :answer_text,
                                   :deck_id, :font, :font_size,
                                   :background_color, :foreground_color)
    end
end

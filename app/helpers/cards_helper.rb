module CardsHelper

  def style_for(card)
    %Q{style="background-color: #{card.background_color}; color:#{card.foreground_color}; font-size: #{card.font_size}pt; font-family: #{card.font}"}.html_safe
  end
end

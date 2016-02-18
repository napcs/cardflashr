var Player = React.createClass({

  getInitialState: function() {
    return {card: this.props.card, cardIndex: this.props.cardIndex};
  },

  loadCard: function(id) {
    let url =  "/player/" + this.props.deck_id + ".json?card=" + id;

    console.log(url);
    $.ajax({
      url: url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        // update state. Causes new card to render.
        this.setState({card: data, cardIndex: id});
      }.bind(this)
    });
  },

  previousCard: function() {
    id = Number(this.state.cardIndex) - 1;
    this.loadCard(id);
  },

  nextCard: function() {
    id = Number(this.state.cardIndex) + 1;
    this.loadCard(id);
  },

  render: function() {

    if (this.state.cardIndex > 0) {
      backButton = <button onClick={e => this.previousCard()}>Back</button>;
    } else {
      backButton = <div>&nbsp;</div>;
    }

    if (this.state.cardIndex + 1 < this.props.numberOfCards) {
      nextButton = <button onClick={e => this.nextCard()}>Next</button>
    } else {
      nextButton = <div>&nbsp;</div>;
    }

    return(
      <div className="player">
        {backButton}
        <Card
          key={this.state.card.id}
          answer_text={this.state.card.answer_text}
          question_text={this.state.card.question_text}
          background_color={this.state.card.background_color}
          foreground_color={this.state.card.foreground_color}
          font={this.state.card.font}
          font_size={this.state.card.font_size}
        />
        {nextButton}
      </div>
    );
  }
});

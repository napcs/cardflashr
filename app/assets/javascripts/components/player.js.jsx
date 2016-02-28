var Player = React.createClass({

  getInitialState: function() {
    return {card: this.props.card, cardIndex: this.props.cardIndex};
  },

  // Called after component mounts
  // Add hammer events to this component.
  componentDidMount: function() {
    this.hammer = Hammer(this.getDOMNode());
    this.hammer.on('swipeleft', this.nextCard);
    this.hammer.on('swiperight', this.previousCard);
  },

  // called before component unmounts.
  // Need to remove any elements so things clean up.
  componentWillUnmount: function() {
    this.hammer.off('swipeleft', this.nextCard);
    this.hammer.off('swiperight', this.previousCard);
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

  isPreviousCardAvailable: function() {
    return (
      this.state.cardIndex > 0
    );
  },

  previousCard: function() {
    if (this.isPreviousCardAvailable()) {
      id = Number(this.state.cardIndex) - 1;
      this.loadCard(id);
    }
  },

  isNextCardAvailable: function () {
    return (
      this.state.cardIndex + 1 < this.props.numberOfCards
    );
  },

  nextCard: function() {
    if (this.isNextCardAvailable()) {
      id = Number(this.state.cardIndex) + 1;
      this.loadCard(id);
    }
  },

  render: function() {

    if (this.isPreviousCardAvailable()) {
      backButton = <button onClick={e => this.previousCard()}>Back</button>;
    } else {
      backButton = <div>&nbsp;</div>;
    }

    if (this.isNextCardAvailable()) {
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
          question_large_image_url={this.state.card.question_large_image_url}
        />
        {nextButton}
      </div>
    );
  }
});

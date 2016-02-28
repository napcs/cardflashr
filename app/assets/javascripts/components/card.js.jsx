var Card = React.createClass({
  getInitialState: function() {
    return {showAnswer: false};
  },


  propTypes: {
    name: React.PropTypes.string,
    question_text: React.PropTypes.node,
    answer_text: React.PropTypes.node,
    background_color: React.PropTypes.string,
    foreground_color: React.PropTypes.string,
    font_size: React.PropTypes.string,
    font: React.PropTypes.string,
    question_large_image_url: React.PropTypes.string
  },

  showAnswer: function() {
    this.setState({showAnswer: !this.state.showAnswer});
  },

  render: function() {
    let style = {
      backgroundColor: this.props.background_color,
      color: this.props.foreground_color,
      fontFamily: this.props.font,
      fontSize: this.props.font_size
    };

    if (this.state.showAnswer) {
      var content = <p>{this.props.answer_text}</p>;
    } else {

      let image = this.props.question_large_image_url !== "" ? <img src={this.props.question_large_image_url}/> : "";
      var content = <p>{image}{this.props.question_text}</p>
    }

    return (
      <div className="card" style={style} onClick={e => this.showAnswer()}>
        {content}
      </div>
    );
  }
});

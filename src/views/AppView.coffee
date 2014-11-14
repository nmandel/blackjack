class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('playerHand').stand()
      @model.get('dealerHand').first().flip()
      @model.get('dealerHand').hit()
      playerScore = @model.get('playerHand').getScore()
      dealerScore = @model.get('dealerHand').getScore()
      if playerScore > dealerScore
        alert "You win bitch!"
      else
        alert "I'm not mad, just disappointed in your playing abilities."
      # get player and dealer hand score, compare
      # alert the winner
      #playerScore = @model.get('playerHand')
      #console.log playerScore
      #if @model.get('playerHand').$('.score').text

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


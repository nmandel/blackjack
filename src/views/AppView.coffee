class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="chip-count"><%= window.chips %></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      playerScore = @model.get('playerHand').getScore()
      @model.get('dealerHand').first().flip()
      @model.get('dealerHand').hit()
      # get player and dealer hand score, compare
      # playerScore = @model.get('playerHand').getScore()
      dealerScore = @model.get('dealerHand').getScore()
      # alert the winner
      if !window.gameOver
        @model.get('playerHand').endgame(playerScore > dealerScore)
        window.gameOver = false

  initialize: ->
    @render()
    # console.log @
    @model.on 'newGame', @render

  render: =>
    # console.log @
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  logger: ->
    # console.log @

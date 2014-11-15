# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    # console.log @
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # console.log @
    @get('playerHand').on 'dealEmOut', =>
      @setup()
    @get('dealerHand').on 'dealEmOut', =>
      @setup()

  setup: ->
    # console.log @get 'deck'
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @trigger 'newGame', @ # HERE IS THE ERROR! o.0
    # console.log @get 'deck'

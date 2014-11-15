# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'dealEmOut', =>
      @setup()
    @get('dealerHand').on 'dealEmOut', =>
      @setup()

  setup: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @trigger 'newGame', @ # HERE IS THE ERROR! o.0

    window.view.remove()
    window.view = new AppView(model: new App()).$el.appendTo 'body'


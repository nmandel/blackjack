class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  getScore: ->
    if @scores()[1] <= 21
      @trigger('stand', @)
      @scores()[1]
    else
      @trigger('change', @)
      @scores()[0]

  hit: ->
    if !@isDealer
      if @scores()[0] < 21
        @add(@deck.pop())
      if @scores()[0] > 21
        #@trigger('change', @)
        @endgame(false)
    else
      while @getScore() < 17
        @add(@deck.pop())
        if @getScore() > 21
          @endgame(true)

      #evalutate player and dealer score

  stand: ->
    # if hasAce and score is less than 12
    #   return this.scores()[1]
    # else return this.scores()[0]
    if @scores()[1] <= 21
      @trigger 'stand', @
    else
      @trigger 'change', @

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  endgame: (didWin) ->
    window.gameOver = true
    # create a newgame variable that creates a confirm alert
    if !didWin
      gameOverMsg = "I'm not mad, just disappointed in your playing abilities."
    else
      gameOverMsg = "You win bitch!"
    newGame = confirm gameOverMsg + "\n\n Play again?"
    # if newGame is true, then reset the game
    if newGame
      @trigger 'dealEmOut', @




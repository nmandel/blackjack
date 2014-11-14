class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'stand', => @standRender()
    #@collection.on 'dealerPlay', => @dealerHitRender()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    #@collection.get('score').set('score', parseInt(@$('.score').text))
    console.log @collection.getScore()

  standRender: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[1]
    #@collection.get('score').set('score', parseInt(@$('.score').text))
    console.log @collection.getScore()


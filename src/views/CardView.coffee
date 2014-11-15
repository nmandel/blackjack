class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    url: "url(img/cards/"+@model.rankName+"-"+suitName.toLowerCase()+".png)"
    @css "background-image", @get url
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'


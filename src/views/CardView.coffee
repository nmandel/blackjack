class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    # url: "url(img/cards/"+@model.rankName+"-"+suitName.toLowerCase()+".png)"
    # @css "background-image", @get url
    #
    @$el.css("background-image", "url(img/cards/"+@model.get('rankName')+"-"+@model.get('suitName').toLowerCase()+".png)")
    @render()
    @model.on 'change', =>
      @render

  render: ->
    unless @model.get 'revealed'
      @$el.addClass 'covered'
      @$el.css("background-image", 'url("img/card-back.png")')
    else
      @$el.css("background-image", "url(img/cards/"+@model.get('rankName')+"-"+@model.get('suitName').toLowerCase()+".png)")
    @$el.children().detach()
    @$el.html @template @model.attributes


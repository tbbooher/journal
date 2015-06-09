# at the moment routes are only on client, but it may change
# (e.g. using fast-render)
if Meteor.isClient

  Router.route '/', ->
    @render 'entries'
    return

  Router.route '/analysis', ->
    @render 'Analysis'
    return


# at the moment routes are only on client, but this may change
# (e.g. using fast-render)

if Meteor.isClient

  Router.route '/', (->
    @render 'entries'
    return
  ), name: 'new_entry'

  Router.route '/analysis', ->
    @render 'Analysis'
    return

  Router.route 'entry/:entryDate', (->
    params = @params
    @render 'entries', data: ->
      Entries.findOne entry_date: params.entryDate.replace(/-/g,'/')
    return
  ), name: 'entry'
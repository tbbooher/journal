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
  
#  Router.configure
#    notFoundTemplate: 'not_found'
#    loadingTemplate: 'loading'
#    layoutTemplate: 'layout'  

  Router.route 'entry/:entryDate',
    action: ->
      params = @params
      @render 'entries', data: ->
        Entries.findOne(
          entry_date: params.entryDate.replace /-/g,'/'
          owner: Meteor.userId()
        )
      return
    name: 'entry'
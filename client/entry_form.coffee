# todo: should use simple-schema and autoform modules

Template.entry_form.onRendered ->
  $('#entry_date').datepicker orientation: "top left"

  @autorun =>
    data = Template.currentData()
    if data?.entry_date
      for fieldName in entrySchema
        @$("[name=#{fieldName}]").val data[fieldName]
    else
      @$("form")[0].reset()


Template.entry_form.events 'submit #journal_entry_form': (event) ->
  event.preventDefault()
  entry = 'owner': Meteor.userId()
  entry[field] = event.target[field].value for field in entrySchema
  dbUpsert = Entries.upsert "_id":@_id, entry
  event.target.reset() if dbUpsert.insertedId
  return

Template.entry_form.helpers
  isNewEntry: -> !@entry_date && true
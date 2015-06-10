# todo: should use simple-schema and autoform modules
entrySchema = [
# owner (to simplify working with the form the user isn't included here)
  'entry_date'
  'description'
  'friends'
  'networking'
  'consulting'
  'to_read'
  'goals'
  'memory_verse'
  'purity'
  'fitness'
  'devotional'
  'wife'
  'relational'
  'discipline'
  'stress'
  'friends_in_focus'
  'health_statement'
  'lack_of_discipline'
  'sick'
  'flossed'
  'workout'
  'problem_attempted'
  'problem_solved'
# at_work,at_home,at_home_pc,someday_maybe,blog_post_ideas,facepicking
]

Template.entry_form.onRendered ->
  $('#entry_date').datepicker orientation: "top left"

  @autorun =>
    data = Template.currentData()
    if data?.entry_date
      for fieldName, fieldVal of data
        @$("[name=#{fieldName}]").val fieldVal
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
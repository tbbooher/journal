# todo: should use simple-schema and autoform modules

#Template.entry_form.onCreated ->

Template.entry_form.onRendered ->
  $("#owner").val(Meteor.userId())
  $("#entry_date_id").datepicker 'update', new Date

#entrySchema = ['entry_date',  'description',  'friends_in_focus',  'memory_verse',  'workout_done',  'purity',  'devotional',  'discipline',  'fitness',  'wife',  'relational',  'stress',  'flossed',  'sick',  'problem_solved',  'problem_attempted',  'lack_of_discipline',  'workout']

#@autorun =>
#  data = Template.currentData()
#  if data?.entry_date
#    for fieldName in entrySchema
#      @$("[name=#{fieldName}]").val data[fieldName]
#  else
#    @$("form")[0].reset()


#Template.entry_form.events 'submit #journal_entry_form': (event) ->
#  event.preventDefault()
#  entry = 'owner': Meteor.userId()
#  # need to take care of created_at
#  entry[field] = event.target[field].value for field in entrySchema
#  console.log entry
#  dbUpsert = Entries.upsert "_id":@_id, entry
#  event.target.reset() if dbUpsert.insertedId
#  return

Template.entry_form.helpers
  isNewEntry: -> !@entry_date && true
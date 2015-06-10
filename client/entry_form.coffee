Template.entry_form.rendered = ->
  $('#entry_date').datepicker(
    orientation: "top left"
  )
  return

# todo: should use simple-schema module
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

Template.entry_form.events 'submit #journal_entry_form': (event) ->
  event.preventDefault()
  entry = 'owner': Meteor.userId()
  entry[field] = event.target[field].value for field in entrySchema
  Entries.insert entry
  event.target.reset()
  return
root = exports ? this  # the global context

root.Entries = new (Mongo.Collection)('entries')

# would like to autogenerate a form from this . . .

Schemas.Entry = new SimpleSchema
  entry_date:
    type: Date
    label: 'Date'
    optional: false
  # TODO: how do we score this -- bson id???
  owner:
    type: String  # ??
    label: 'owner'
    max: 200
  # text fields
  description:
    type: String
    label: 'Description'
    max: 1000
  friends_in_focus:
    type: String
    label: 'Friends in focus'
    max: 500
  memory_verse:
    type: String
    label: 'Memory Verse'
    max: 500
  workout_done:
    type: String
    label: 'Friends'
    max: 500    
  # daily scores (integers)
  purity:
    type: Number
    min: 0
    max: 5
  devotional:
    type: Number
    min: 0
    max: 5
  discipline:
    type: Number
    min: 0
    max: 5
  fitness:
    type: Number
    min: 0
    max: 5
  wife:
    type: Number
    min: 0
    max: 5
  relational:
    type: Number
    min: 0
    max: 5
  stress:
    type: Number
    min: 0
    max: 5
  # checkboxes: Workout   Prob attempt   Prob Solved   Flossed   Sick   No Discip
  flossed:
    type: Boolean
  sick:
    type: Boolean
  problem_solved:
    type: Boolean
  problem_attempted:
    type: Boolean
  lack_of_discipline:
    type: Boolean
  workout:
    type: Boolean
  # next action lists (I think we delete these)
#  friends:
#    type: String
#    label: 'Friends'
#    max: 200
#  goals:
#    type: String
#    label: 'goals'
#    max: 200
#  networking:
#    type: String
#    label: 'networking'
#    max: 200
#  to_read:
#    type: String
#    label: 'to_read'
#    max: 200
#  at_home:
#    type: String
#    label: 'at_home'
#    max: 200
#  at_home_pc:
#    type: String
#    label: 'at_home_pc'
#    max: 200
#  at_work:
#    type: String
#    label: 'at_work'
#    max: 200
#  blog_post_ideas:
#    type: String
#    label: 'blog_post_ideas'
#    max: 200
#  someday_maybe:
#    type: String
#    label: 'someday_maybe'
#    max: 200
#  problem_of_the_day:
#    type: String
#    label: 'problem_of_the_day'
#    max: 200
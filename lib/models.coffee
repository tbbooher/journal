root = exports ? this  # the global context # what is this for

root.Entries = new (Mongo.Collection)('entries')

# would like to autogenerate a form from this . . .

Schemas = {}

Schemas.Entry = new SimpleSchema(
  entry_date:
    type: Date
    autoform:
      type: "bootstrap-datepicker"
      id: 'entry_date'
    label: 'Date'
    optional: false
    index: -1
    unique: true  
  # TODO: how do we score this -- bson id???
  owner:
    type: String
    label: 'owner'
    autoform:
      id: 'owner'
  # text fields
  description:
    type: String
    autoform:
      type: 'textarea'
      rows: 5
    label: 'Description'
    max: 1000
    optional: true
  friends_in_focus:
    type: String
    label: 'Friends in Focus'
    max: 500
    optional: true
  memory_verse:
    type: String
    label: 'Memory Verse'
    max: 500
    optional: true
  workout_done:
    type: String
    label: 'Friends'
    max: 500
    optional: true
  # daily score slider fields (integers)
  purity:
    type: Number
    min: 0
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3
  devotional:
    type: Number
    min: 0
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3
  discipline:
    type: Number
    min: 0
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3
  fitness:
    type: Number
    min: 1
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3
  wife:
    type: Number
    min: 0
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3  
  relational:
    type: Number
    min: 0
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3
  stress:
    type: Number
    min: 0
    max: 5
    optional: true
    autoform:
      type: 'range'
      step: 1
      min: 1
      max: 5
      value: 3
  # checkboxes: Workout   Prob attempt   Prob Solved   Flossed   Sick   No Discip
  flossed:
    type: Boolean
    optional: true
  sick:
    type: Boolean
    optional: true
  problem_solved:
    type: Boolean
    optional: true
  problem_attempted:
    type: Boolean
    optional: true
  lack_of_discipline:
    type: Boolean
    optional: true
  workout:
    type: Boolean
    optional: true
  # optional
  updatedAt:
    type: Date
    autoValue: ->
      return new Date if @isUpdate
    denyInsert: true
    optional: true  
  createdAt:
    type: Date,
    autoValue: ->
      if @isInsert
        return new Date
      else if @isUpsert
        return { $setOnInsert: new Date }
      else
        @unset()
      return)

Entries.attachSchema(Schemas.Entry);
  
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
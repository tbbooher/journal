require 'pg'
require 'mongo'

conn = PG::Connection.open(:dbname => 'booher_family')

entries = Mongo::Client.new([ '127.0.0.1:3001' ], {database: 'meteor'}).database.collections.first

fe = entries.find({"owner": "PZhYegLmpmhwxdRGo"}).first

owner = fe["owner"]

entries.find.delete_many

#entries.find.each do |e|
#  puts e['entry_date']
#end

res = conn.exec_params('select * from journal_entries;')

in_postgres = ["entry_date", "description", "purity", "lack_of_discipline", "fitness", "devotional", "chrissy", "relational", "discipline", "facepicking", "stress", "sick", "flossed", "workout", "health_statement", "to_do", "memory_verse", "friends_in_focus", "problem_of_the_day", "problem_attempted", "problem_solved", "created_at", "updated_at", "at_work", "at_home", "at_home_pc", "someday_maybe", "blog_post_ideas", "friends", "workout_done", "networking", "consulting", "to_read", "goals"]

in_meteor = ["owner", "entry_date", "description", "at_work", "at_home", "at_home_pc","someday_maybe", "blog_post_ideas", "friends", "networking", "consulting", "to_read", "goals", "memory_verse", "purity", "fitness", "devotional", "wife", "relational", "discipline", "stress", "friends_in_focus", "health_statement", "lack_of_discipline", "sick", "flossed", "workout", "problem_attempted", "problem_solved"]

joint = (in_meteor & in_postgres)

not_shared = (in_meteor | in_postgres) - joint

res.each do |r|
#  r = res[i]
  new_entry = {"owner": owner, "wife": r['chrissy']}
  joint.each do |key|
    new_entry[key] = r[key]
  end # key
  entries.insert_one(new_entry)
end


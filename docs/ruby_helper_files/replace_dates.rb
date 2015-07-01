#!/Users/christinebooher/.rvm/rubies/ruby-2.2.1/bin/ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

entries = Mongo::Client.new('mongodb://127.0.0.1:3001/meteor')["entries"]

#entries = client["entries"]

dates = entries.find.map{|e| e[:entry_date]}

dates.each do |d|
  new_date = d.gsub(/(\d+)\-(\d+)\-(\d+)/) {"#{$2}/#{$3}/#{$1}"}
  puts "replacing #{entries.find({:entry_date => d}).first[:entry_date]} with #{new_date}" # .update_one("$set" => {:entry_date => new_date})
  entries.find({:entry_date => d}).update_one("$set" => {:entry_date => new_date})
end
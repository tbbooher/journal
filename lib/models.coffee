root = exports ? this  # the global context

root.Entries = new (Mongo.Collection)('entries')

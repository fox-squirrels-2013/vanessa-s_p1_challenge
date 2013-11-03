require 'active_record'
require_relative '../app/models/note'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
  database: 'p2pc-1_development' )

Note.delete_all
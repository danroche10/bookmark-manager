require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  print "environ is test?!"
  DatabaseConnection.setup('bookmark_manager_test')
else
  print "this one right?!?!!"
  DatabaseConnection.setup('bookmark_manager')
end
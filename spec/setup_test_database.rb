require 'pg'

def setup_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec "TRUNCATE TABLE bookmarks"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/')"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.google.com/')"
  con.exec "INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com')"
end
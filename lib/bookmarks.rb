require 'pg'

class Bookmarks

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    
    rs = con.exec "SELECT * FROM bookmarks"
    rs.map { |row| row['url'] }
  end

  def self.add(url)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    
    rs = con.exec "INSERT INTO bookmarks (url) VALUES ('#{url}')"
  end
end

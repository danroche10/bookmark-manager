require 'pg'

class Bookmarks

  def self.all
    begin
      con = PG.connect :dbname => 'bookmark_manager'
      rs = con.exec "SELECT * FROM bookmarks"
      rs.map { |row| row['url'] }
    end
  end
end

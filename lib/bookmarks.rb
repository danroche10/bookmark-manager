require 'pg'

class Bookmarks

  def self.all
    begin
      con = PG.connect :dbname => 'bookmark_manager'
      rs = con.exec "SELECT * FROM bookmarks"
      rs.each { |row| puts row['url'] }
    rescue PG::Error => exception
      "Error"
    ensure
      rs.clear if rs
      con.close if con
    end
  end
end

require 'pg'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs = con.exec('SELECT * FROM bookmarks')
    rs.map do |row| 
      Bookmarks.new(id: row['id'], title: row['title'], url: row['url'])
    end
  end

  def self.add(url, title)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    
    rs = con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title"
    Bookmarks.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end

  def self.delete(id)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    
    con.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

end

# Bookmarks.delete(id: 15)
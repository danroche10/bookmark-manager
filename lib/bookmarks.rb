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

  def self.find(id)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs = con.exec_params("SELECT * FROM bookmarks WHERE id = $1", [id] )
    Bookmarks.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])  
  end

  def self.update(id:, url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    rs = connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, url, title;",
      [url, title, id]
    )
    Bookmarks.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end
end

# print Bookmarks.update(id: 1, url: "marginalrevolution.com", title: "MR").title
require 'pg'
require_relative 'database_connection'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM bookmarks")
    rs.map do |row| 
      Bookmarks.new(id: row['id'], title: row['title'], url: row['url'])
    end
  end

  def self.add(url, title)
    rs = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, title, url;", [url, title])
    Bookmarks.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end

  def self.delete(id)
    DatabaseConnection.query(
      "DELETE FROM bookmarks WHERE id = $1;", [id]
    )
  end

  def self.find(id)
    rs = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = $1;", [id] )
    Bookmarks.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])  
  end

  def self.update(id:, url:, title:)
    rs = DatabaseConnection.query(
      "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, url, title;",
      [url, title, id]
    )
    Bookmarks.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end
end

# print Bookmarks.update(id: 1, url: "marginalrevolution.com", title: "MR").title
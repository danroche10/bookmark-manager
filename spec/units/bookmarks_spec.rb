require 'bookmarks'
require_relative './database_helpers'

describe Bookmarks do

  describe '#self.all' do
    it 'returns all bookmarks' do

      bookmark = Bookmarks.add("http://bbc.co.uk", "BBC")
      Bookmarks.add('http://www.facebook.com', 'Facebook')

      bookmarks = Bookmarks.all
      
      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'BBC'
      expect(bookmarks.first.url).to eq 'http://bbc.co.uk'
    end
  end

  describe "#self.add" do
    it "should add bookmark to database" do
      bookmark = Bookmarks.add('http://www.facebook.com/', 'Facebook')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Facebook'
      expect(bookmark.url).to eq 'http://www.facebook.com/'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmarks.add('http://www.facebook.com/', 'Facebook')
      Bookmarks.add('http://www.makersacademy.com', 'Makers Academy')
      
      Bookmarks.delete(bookmark.id)

      expect(Bookmarks.all.length).to eq 1
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmarks.add('http://www.makersacademy.com', 'Makers Academy')
      result = Bookmarks.find(bookmark.id)
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'

    end
  end





end
require 'bookmarks'
require_relative './database_helpers'

describe Bookmarks do

  let(:bookmarks) { Bookmarks.all }
  let(:bookmark_object) {}

  describe '#self.all' do
    it 'returns all bookmarks' do
      expect(bookmarks).to include(
      "http://www.makersacademy.com/",
      "http://www.google.com/",
      "http://www.destroyallsoftware.com"
      )
    end
  end

  describe "#self.add" do
    it "should add bookmark to database" do
      bookmark = Bookmarks.add('http://www.facebook.com/', 'Facebook')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmarks).to include('http://www.facebook.com/')
    end
  end
end
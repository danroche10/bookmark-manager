require 'bookmarks'

describe Bookmarks do

  let(:bookmarks) { Bookmarks.all }

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
      Bookmarks.add('http://www.facebook.com/')
      expect(bookmarks).to include('http://www.facebook.com/')
    end
  end
end
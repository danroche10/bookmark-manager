require 'bookmarks'

describe Bookmarks do

  let(:bookmarks) { Bookmarks.all }

  context '#self.all' do
    it 'returns all bookmarks' do
      expect(bookmarks).to include(
      "http://www.makersacademy.com/",
      "http://www.google.com/",
      "http://www.destroyallsoftware.com"
      )
    end
  end
end
require 'bookmarks'

describe Bookmarks do

  let(:bookmarks) { Bookmarks.all }

  context '#self.all' do
    it 'returns all bookmarks' do
      expect(bookmarks).to include(
      "https://www.mozilla.org/en-GB/",
      "https://ruby-doc.org/",
      "https://www.codewars.com/"
      )
    end
  end
end
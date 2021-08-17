require 'bookmarks'

describe Bookmarks do

  let(:bookmarks) { Bookmarks.all }

  context '#self.all' do
    it 'returns all bookmarks' do
      expect { bookmarks }.to output(
      "http://www.makersacademy.com/\nhttp://www.google.com/\nhttp://www.destroyallsoftware.com\n"
      ).to_stdout
    end
  end
end
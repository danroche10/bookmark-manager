require 'bookmarks'

describe Bookmarks do

  context '#initialize' do
    it 'is expected to have empty folder' do
      expect(subject.folder).to eq([])
    end
  end
end
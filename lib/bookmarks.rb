class Bookmarks
  attr_reader :folder

  def initialize(folder = [])
    @folder = folder
  end
end
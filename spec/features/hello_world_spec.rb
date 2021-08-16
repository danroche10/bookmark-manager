feature 'test our website has infrastructure' do
  scenario 'index outputs hello world' do
    visit('/')
    find_button('Bookmarks').click
  end
end
feature 'bookmark route is available' do
  scenario 'able to view the bookmarks' do
    visit('/')
    click_button('Bookmarks')
    expect(page).to have_content('J.R.R Tolkien - Lord of The Rings')
  end
end
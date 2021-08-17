feature 'user can add a new bookmark to the list' do
  scenario 'add new bookmark' do
    visit('/bookmarks')
    click_button('Add Bookmarks')
    fill_in('url', with: 'http://www.google.com/')
    click_button('Add to List')
    expect(page).to have_content('http://www.google.com/')
  end
end
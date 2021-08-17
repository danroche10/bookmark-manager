feature 'bookmark route is available' do
  scenario 'able to view the bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("http://www.makersacademy.com/")
    expect(page).to have_content("http://www.google.com/")
    expect(page).to have_content("http://www.destroyallsoftware.com")
  end
end
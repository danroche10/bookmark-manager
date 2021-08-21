feature 'bookmark route is available' do
  scenario 'able to view the bookmarks' do
    Bookmarks.add('http://www.makersacademy.com/', 'Makers')
    Bookmarks.add('http://www.google.com/', 'Google')
    Bookmarks.add('http://www.destroyallsoftware.com', 'DAS')
    visit('/bookmarks')
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com/")
    expect(page).to have_link("Google", href: "http://www.google.com/")
    expect(page).to have_link("DAS", href: "http://www.destroyallsoftware.com")
  end
end


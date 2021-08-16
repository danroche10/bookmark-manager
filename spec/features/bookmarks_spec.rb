feature 'bookmark route is available' do
  scenario 'able to view the bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("https://www.mozilla.org/en-GB/")
    expect(page).to have_content("https://ruby-doc.org/")
    expect(page).to have_content("https://www.codewars.com/")
  end
end
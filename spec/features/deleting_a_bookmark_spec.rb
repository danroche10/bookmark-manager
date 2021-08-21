feature 'User can delete a bookmark' do

  scenario 'page has at least one delete button' do
    Bookmarks.add('http://www.facebook.com', 'Facebook')
    visit('/bookmarks')
    expect(page).to have_selector(:link_or_button, 'Delete')
  end

  scenario 'page no longer has link after it has been deleted' do
    Bookmarks.add('http://www.facebook.com', 'Facebook')
    visit('/bookmarks')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com/')
  end

end
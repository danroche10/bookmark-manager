feature 'test our website has infrastructure' do
  scenario 'index outputs hello world' do
    visit('/')
    expect(page).to have_content('Hello World')
  end
end
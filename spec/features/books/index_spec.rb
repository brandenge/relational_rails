require 'rails_helper'

RSpec.describe 'Books Index Page', type: :feature do
  it 'shows a "Books Index" header' do
    visit '/books'

    expect(page).to have_content("Books Index")
  end

  it 'shows all of the book titles' do
    visit '/books'

    expect(page).to have_content('Scattered Minds')
    expect(page).to have_content('How Attention Deficit Disorder Originates and What You Can Do About It')
    expect(page).to have_content('Author: Gabor Mate')

    expect(page).to have_content('The Tipping Point')
    expect(page).to have_content('How Little Things Can Make a Big Difference')
    expect(page).to have_content('Author: Malcolm Gladwell')

    expect(page).to have_content('Permission Marketing')
    expect(page).to have_content('Turning Strangers into Friends, and Friends into Customers')
    expect(page).to have_content('Author: Seth Godin')

    expect(page).to have_content('The Hobbit')
    expect(page).to have_content('Author: J.R.R. Tolkien')
  end
end

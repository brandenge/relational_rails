require 'rails_helper'

RSpec.describe 'Books Index Page', type: :feature do
  describe 'header tests' do
    before(:each) do
      visit '/books'
    end

    it 'has a "Relational Rails - Authors and Books" header' do
      expect(page).to have_content('Relational Rails - Authors and Books')
    end

    it 'has a link to the authors index page' do
      click_link('Authors Index')

      expect(current_path).to eq('/authors')
    end

    it 'has a link to the books index page' do
      click_link('Books Index')

      expect(current_path).to eq('/books')
    end
  end

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

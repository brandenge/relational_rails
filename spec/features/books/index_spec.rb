require 'rails_helper'

RSpec.describe 'Books Index Page', type: :feature do
  before(:each) do
    visit '/books'
  end

  describe 'header tests' do
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
    expect(page).to have_content("Books Index")
  end

  it 'shows the book that are in print' do
    expect(page).to have_content('Title: Scattered Minds')
    expect(page).to have_content('Subtitle: How Attention Deficit Disorder Originates and What You Can Do About It')
    expect(page).to have_content('Author: Gabor Mate')

    expect(page).to have_content('Title: The Tipping Point')
    expect(page).to have_content('Subtitle: How Little Things Can Make a Big Difference')
    expect(page).to have_content('Author: Malcolm Gladwell')

    expect(page).to have_content('Title: Permission Marketing')
    expect(page).to have_content('Subtitle: Turning Strangers into Friends, and Friends into Customers')
    expect(page).to have_content('Author: Seth Godin')

    expect(page).to have_content('Title: The Hobbit')
    expect(page).to have_content('Author: J.R.R. Tolkien')
  end

  it 'does not show the books that are not in print' do
    expect(page).to_not have_content('Title: Email Addresses of the Rich & Famous')
    expect(page).to_not have_content('Title: Unleashing the Ideavirus')
    expect(page).to_not have_content('Title: On Fairy-Stories')
  end

  it 'has a link to the book show page' do
    visit '/books'

    click_link("#{@book1_1.title}")

    expect(current_path).to eq("/books/#{@book1_1.id}")
  end

  it 'has a link to edit each book' do
    visit '/books'
    click_link "Edit #{@book1_1.title}"

    expect(current_path).to eq("/books/#{@book1_1.id}/edit")

    visit '/books'
    click_link "Edit #{@book1_2.title}"

    expect(current_path).to eq("/books/#{@book1_2.id}/edit")

    visit '/books'
    click_link "Edit #{@book1_3.title}"

    expect(current_path).to eq("/books/#{@book1_3.id}/edit")

    visit '/books'
    click_link "Edit #{@book1_4.title}"

    expect(current_path).to eq("/books/#{@book1_4.id}/edit")

    visit '/books'
    click_link "Edit #{@book1_5.title}"

    expect(current_path).to eq("/books/#{@book1_5.id}/edit")
  end

  it 'has a delete link next to each book' do
    click_link "Delete #{@book1_1.title}"

    expect(page).to_not have_content(@book1_1.title)
  end
end

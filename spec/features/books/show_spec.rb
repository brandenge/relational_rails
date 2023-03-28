require 'rails_helper'

RSpec.describe 'Books Show Page', type: :feature do
  describe 'header tests' do
    before(:each) do
      visit "/books/#{@book1_1.id}"
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

  it 'has a button on the book index page that links to the book show page' do
    visit '/books'

    click_link("#{@book1_1.title}")

    expect(current_path).to eq("/books/#{@book1_1.id}")
  end

  it 'has a "Book Details" header' do
    visit "/books/#{@book1_1.id}"

    expect(page).to have_content('Book Details')
  end

  it 'shows all of the book\'s details' do
    visit "/books/#{@book1_1.id}"

    expect(page).to have_content("Title: #{@book1_1.title}")
    expect(page).to have_content("Subtitle: #{@book1_1.subtitle}")
    expect(page).to have_content("Author: #{@book1_1.author.name}")
    expect(page).to have_content("Publisher: #{@book1_1.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_1.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_1.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_1.page_count}")
    expect(page).to have_content("ID: #{@book1_1.id}")
    expect(page).to have_content("Created At: #{@book1_1.created_at}")
    expect(page).to have_content("Updated At: #{@book1_1.updated_at}")
  end

  it 'shows all of another book\'s details' do
    visit "/books/#{@book4_1.id}"

    expect(page).to have_content("Title: #{@book4_1.title}")
    expect(page).to have_content("Author: #{@book4_1.author.name}")
    expect(page).to have_content("Publisher: #{@book4_1.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_1.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_1.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_1.page_count}")
    expect(page).to have_content("ID: #{@book4_1.id}")
    expect(page).to have_content("Created At: #{@book4_1.created_at}")
    expect(page).to have_content("Updated At: #{@book4_1.updated_at}")
  end
end

require 'rails_helper'

RSpec.describe 'Author Show Page', type: :feature do
  describe 'header tests' do
    before(:each) do
      visit "/authors/#{@gabor_mate.id}"
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

  it 'has a link on the author index page that links to the author show page' do
    visit '/authors'

    click_link(@gabor_mate.name)

    expect(current_path).to eq("/authors/#{@gabor_mate.id}")
  end

  it 'shows an "Author Details" header' do
    visit "/authors/#{@gabor_mate.id}"

    expect(page).to have_content("Author Details")
  end

  it 'shows all the author\'s details' do
    visit "/authors/#{@gabor_mate.id}"

    expect(page).to have_content("Name: #{@gabor_mate.name}")
    expect(page).to have_content("Birthdate: #{@gabor_mate.birthdate}")
    expect(page).to have_content("Is Alive: #{@gabor_mate.is_alive}")
    expect(page).to have_content("Citation Count: #{@gabor_mate.citation_count}")
    expect(page).to have_content("ID: #{@gabor_mate.id}")
    expect(page).to have_content("Created At: #{@gabor_mate.created_at}")
    expect(page).to have_content("Updated At: #{@gabor_mate.updated_at}")
  end

  it 'shows all of another author\'s details' do
    visit "/authors/#{@jrr_tolkien.id}"

    expect(page).to have_content("Name: #{@jrr_tolkien.name}")
    expect(page).to have_content("Birthdate: #{@jrr_tolkien.birthdate}")
    expect(page).to have_content("Is Alive: #{@jrr_tolkien.is_alive}")
    expect(page).to have_content("Citation Count: #{@jrr_tolkien.citation_count}")
    expect(page).to have_content("ID: #{@jrr_tolkien.id}")
    expect(page).to have_content("Created At: #{@jrr_tolkien.created_at}")
    expect(page).to have_content("Updated At: #{@jrr_tolkien.updated_at}")
  end

  it 'shows the number of books the author has written' do
    visit "/authors/#{@gabor_mate.id}"

    expect(page).to have_content("Number of Published Books: #{@gabor_mate.books.size}")

    visit "/authors/#{@malcolm_gladwell.id}"

    expect(page).to have_content("Number of Published Books: #{@malcolm_gladwell.books.size}")

    visit "/authors/#{@seth_godin.id}"

    expect(page).to have_content("Number of Published Books: #{@seth_godin.books.size}")

    visit "/authors/#{@jrr_tolkien.id}"

    expect(page).to have_content("Number of Published Books: #{@jrr_tolkien.books.size}")
  end

  it 'has a link to the author\'s bibliography' do
    visit "/authors/#{@gabor_mate.id}"

    click_link "#{@gabor_mate.name} Bibliography"

    expect(current_path).to eq("/authors/#{@gabor_mate.id}/books")
  end
end

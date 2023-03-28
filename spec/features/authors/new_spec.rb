require 'rails_helper'

RSpec.describe 'New Author Page', type: :feature do
  before(:each) do
    visit '/authors/new'
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

  it 'has a "New Author" header ' do
    expect(page).to have_content('New Author')
  end

  it 'can create a new author' do
    fill_in('Name', with: 'Cal Newport')
    fill_in('Birthdate', with: '06231982')
    check('Is alive')
    fill_in('Citation count', with: '635')
    click_button('Create Author')

    expect(current_path).to eq('/authors')
    expect(page).to have_content('Cal Newport')
  end
end

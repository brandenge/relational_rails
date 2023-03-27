require 'rails_helper'

RSpec.describe 'Author Show Page', type: :feature do
  it 'has a button on the author index page that links to the author show page' do
    visit '/authors'

    click_button("#{@gabor_mate.name} Details")

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
end

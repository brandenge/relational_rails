require 'rails_helper'

RSpec.describe 'Author Show Page', type: :feature do
  it 'has a button on the author index page that links to the author details page' do
    visit '/authors'

    click_button("#{@gabor_mate.name} Details")

    expect(current_path).to eq("/authors/#{@gabor_mate.id}")
  end

  it 'shows the author details' do
    visit "/authors/#{@gabor_mate.id}"

    expect(page).to have_content("#{@gabor_mate.name}")
    expect(page).to have_content("Birthdate: #{@gabor_mate.birthdate}")
    expect(page).to have_content("Is Alive: #{@gabor_mate.is_alive}")
    expect(page).to have_content("Citation Count: #{@gabor_mate.citation_count}")
  end

  it 'shows another author\'s details' do
    visit "/authors/#{@jrr_tolkien.id}"

    expect(page).to have_content("#{@jrr_tolkien.name}")
    expect(page).to have_content("Birthdate: #{@jrr_tolkien.birthdate}")
    expect(page).to have_content("Is Alive: #{@jrr_tolkien.is_alive}")
    expect(page).to have_content("Citation Count: #{@jrr_tolkien.citation_count}")
  end
end

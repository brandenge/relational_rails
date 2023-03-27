require 'rails_helper'

RSpec.describe 'Author Index Page', type: :feature do
  it 'has an "Authors Index" header ' do
    visit '/authors'

    expect(page).to have_content('Authors Index')
  end

  it 'shows all of the authors' do
    visit '/authors'

    expect(page).to have_content('Gabor Mate')
    expect(page).to have_content('Malcolm Gladwell')
    expect(page).to have_content('Seth Godin')
    expect(page).to have_content('J.R.R. Tolkien')
  end
end

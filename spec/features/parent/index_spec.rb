require 'rails_helper'

RSpec.describe 'Author Index', type: :feature do
  xit 'shows all of the authors' do
    visit '/authors'

    expect(page).to have_content('Gabor Mate')
    expect(page).to have_content('Malcom Gladwell')
  end
end

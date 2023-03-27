require 'rails_helper'

RSpec.describe 'Author Index Page', type: :feature do
  it 'has an "Authors Index" header ' do
    visit '/authors'

    expect(page).to have_content('Authors Index')
  end

  it 'shows all of the authors' do
    visit '/authors'

    expect(page).to have_content("#{@gabor_mate.name}")
    expect(page).to have_content("#{@malcolm_gladwell.name}")
    expect(page).to have_content("#{@seth_godin.name}")
    expect(page).to have_content("#{@jrr_tolkien.name}")
  end

  it 'shows all of the authors ordered by the time they were created at' do
    visit '/authors'

    expect(@gabor_mate.name).to appear_before(@malcolm_gladwell.name)
    expect(@malcolm_gladwell.name).to appear_before(@seth_godin.name)
    expect(@seth_godin.name).to appear_before(@jrr_tolkien.name)
  end
end

require 'rails_helper'

RSpec.describe 'Author Books Page', type: :feature do
  it 'has a "Books By Author" header ' do
    visit "/authors/#{@gabor_mate.id}/books"

    expect(page).to have_content("Books By #{@gabor_mate.name}")

    visit "/authors/#{@jrr_tolkien.id}/books"

    expect(page).to have_content("Books By #{@jrr_tolkien.name}")
  end

  it 'shows all of the author\'s books' do
    visit "/authors/#{@gabor_mate.id}/books"

    expect(page).to have_content("Title: #{@book1_1.title}")
    expect(page).to have_content("Subtitle: #{@book1_1.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_1.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_1.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_1.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_1.page_count}")
    expect(page).to have_content("ID: #{@book1_1.id}")
    expect(page).to have_content("Created At: #{@book1_1.created_at}")
    expect(page).to have_content("Updated At: #{@book1_1.updated_at}")

    expect(page).to have_content("Title: #{@book1_2.title}")
    expect(page).to have_content("Subtitle: #{@book1_2.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_2.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_2.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_2.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_2.page_count}")
    expect(page).to have_content("ID: #{@book1_2.id}")
    expect(page).to have_content("Created At: #{@book1_2.created_at}")
    expect(page).to have_content("Updated At: #{@book1_2.updated_at}")

    expect(page).to have_content("Title: #{@book1_3.title}")
    expect(page).to have_content("Subtitle: #{@book1_3.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_3.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_3.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_3.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_3.page_count}")
    expect(page).to have_content("ID: #{@book1_3.id}")
    expect(page).to have_content("Created At: #{@book1_3.created_at}")
    expect(page).to have_content("Updated At: #{@book1_3.updated_at}")

    expect(page).to have_content("Title: #{@book1_4.title}")
    expect(page).to have_content("Subtitle: #{@book1_4.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_4.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_4.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_4.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_4.page_count}")
    expect(page).to have_content("ID: #{@book1_4.id}")
    expect(page).to have_content("Created At: #{@book1_4.created_at}")
    expect(page).to have_content("Updated At: #{@book1_4.updated_at}")

    expect(page).to have_content("Title: #{@book1_5.title}")
    expect(page).to have_content("Subtitle: #{@book1_5.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_5.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_5.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_5.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_5.page_count}")
    expect(page).to have_content("ID: #{@book1_5.id}")
    expect(page).to have_content("Created At: #{@book1_5.created_at}")
    expect(page).to have_content("Updated At: #{@book1_5.updated_at}")
  end

  it 'shows all of another author\'s books' do
    visit "/authors/#{@jrr_tolkien.id}/books"

    expect(page).to have_content("Title: #{@book4_1.title}")
    expect(page).to have_content("Publisher: #{@book4_1.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_1.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_1.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_1.page_count}")
    expect(page).to have_content("ID: #{@book4_1.id}")
    expect(page).to have_content("Created At: #{@book4_1.created_at}")
    expect(page).to have_content("Updated At: #{@book4_1.updated_at}")

    expect(page).to have_content("Title: #{@book4_2.title}")
    expect(page).to have_content("Subtitle: #{@book4_2.subtitle}")
    expect(page).to have_content("Publisher: #{@book4_2.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_2.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_2.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_2.page_count}")
    expect(page).to have_content("ID: #{@book4_2.id}")
    expect(page).to have_content("Created At: #{@book4_2.created_at}")
    expect(page).to have_content("Updated At: #{@book4_2.updated_at}")

    expect(page).to have_content("Title: #{@book4_3.title}")
    expect(page).to have_content("Publisher: #{@book4_3.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_3.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_3.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_3.page_count}")
    expect(page).to have_content("ID: #{@book4_3.id}")
    expect(page).to have_content("Created At: #{@book4_3.created_at}")
    expect(page).to have_content("Updated At: #{@book4_3.updated_at}")

    expect(page).to have_content("Title: #{@book4_4.title}")
    expect(page).to have_content("Publisher: #{@book4_4.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_4.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_4.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_4.page_count}")
    expect(page).to have_content("ID: #{@book4_4.id}")
    expect(page).to have_content("Created At: #{@book4_4.created_at}")
    expect(page).to have_content("Updated At: #{@book4_4.updated_at}")

    expect(page).to have_content("Title: #{@book4_5.title}")
    expect(page).to have_content("Publisher: #{@book4_5.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_5.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_5.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_5.page_count}")
    expect(page).to have_content("ID: #{@book4_5.id}")
    expect(page).to have_content("Created At: #{@book4_5.created_at}")
    expect(page).to have_content("Updated At: #{@book4_5.updated_at}")

    expect(page).to have_content("Title: #{@book4_6.title}")
    expect(page).to have_content("Publisher: #{@book4_6.publisher}")
    expect(page).to have_content("Publication Date: #{@book4_6.publication_date}")
    expect(page).to have_content("Is In Print: #{@book4_6.is_in_print}")
    expect(page).to have_content("Page Count: #{@book4_6.page_count}")
    expect(page).to have_content("ID: #{@book4_6.id}")
    expect(page).to have_content("Created At: #{@book4_6.created_at}")
    expect(page).to have_content("Updated At: #{@book4_6.updated_at}")
  end
end

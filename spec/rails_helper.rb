require 'simplecov'

SimpleCov.start do
  enable_coverage :branch
end

require './spec/fixtures/author_data'
require './spec/fixtures/book_data'
include AuthorData
include BookData

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

RSpec.describe 'Test Data' do
  let!(:gabor_mate) { Author.create!(GABOR_MATE) }
  let!(:malcolm_gladwell) { Author.create!(MALCOLM_GLADWELL) }
  let!(:seth_godin) { Author.create!(SETH_GODIN) }
  let!(:jrr_tolkien) { Author.create!(JRR_TOLKIEN) }

  let!(:book1_1) { gabor_mate.books.create!(BOOK1_1) }
  let!(:book1_2) { gabor_mate.books.create!(BOOK1_2) }
  let!(:book1_3) { gabor_mate.books.create!(BOOK1_3) }
  let!(:book1_4) { gabor_mate.books.create!(BOOK1_4) }
  let!(:book1_5) { gabor_mate.books.create!(BOOK1_5) }

  let!(:book2_1) { malcolm_gladwell.books.create!(BOOK2_1) }
  let!(:book2_2) { malcolm_gladwell.books.create!(BOOK2_2) }
  let!(:book2_3) { malcolm_gladwell.books.create!(BOOK2_3) }
  let!(:book2_4) { malcolm_gladwell.books.create!(BOOK2_4) }
  let!(:book2_5) { malcolm_gladwell.books.create!(BOOK2_5) }
  let!(:book2_6) { malcolm_gladwell.books.create!(BOOK2_6) }
  let!(:book2_7) { malcolm_gladwell.books.create!(BOOK2_7) }

  let!(:book3_1) { seth_godin.books.create!(BOOK3_1) }
  let!(:book3_2) { seth_godin.books.create!(BOOK3_2) }
  let!(:book3_3) { seth_godin.books.create!(BOOK3_3) }
  let!(:book3_4) { seth_godin.books.create!(BOOK3_4) }
  let!(:book3_5) { seth_godin.books.create!(BOOK3_5) }
  let!(:book3_6) { seth_godin.books.create!(BOOK3_6) }
  let!(:book3_7) { seth_godin.books.create!(BOOK3_7) }
  let!(:book3_8) { seth_godin.books.create!(BOOK3_8) }
  let!(:book3_9) { seth_godin.books.create!(BOOK3_9) }

  let!(:book4_1) { jrr_tolkien.books.create!(BOOK4_1) }
  let!(:book4_2) { jrr_tolkien.books.create!(BOOK4_2) }
  let!(:book4_3) { jrr_tolkien.books.create!(BOOK4_3) }
  let!(:book4_4) { jrr_tolkien.books.create!(BOOK4_4) }
  let!(:book4_5) { jrr_tolkien.books.create!(BOOK4_5) }
  let!(:book4_6) { jrr_tolkien.books.create!(BOOK4_6) }
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
     with.test_framework :rspec
     with.library :rails
  end
end

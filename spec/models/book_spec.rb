require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :publisher }
    it { should validate_presence_of :publication_date }
    it { should validate_exclusion_of(:is_in_print).in_array([nil]) }
    it { should validate_presence_of :page_count }
  end

  describe "relationships" do
    it { should belong_to :author }
  end
end

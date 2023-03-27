require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birthdate }
    it { should validate_presence_of :is_alive }
    it { should validate_presence_of :citation_count }
  end

  describe "relationships" do
    it { should have_many :books }
  end
end

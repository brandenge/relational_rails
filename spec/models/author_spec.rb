require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birthdate }
    it { should validate_exclusion_of(:is_alive).in_array([nil]) }
    it { should validate_presence_of :citation_count }
  end

  describe 'relationships' do
    it { should have_many :books }
  end

  describe 'class methods' do
    describe '::sorted' do
      it 'sorts all the authors by their created at timestamp in ascending order' do
        expect(Author.sorted).to eq([@gabor_mate, @malcolm_gladwell, @seth_godin, @jrr_tolkien])
      end
    end
  end

  describe 'instance methods' do
    describe '#book_count' do
      it 'returns the book count for a given author' do
        expect(@gabor_mate.book_count).to eq(5)
        expect(@malcolm_gladwell.book_count).to eq(7)
        expect(@seth_godin.book_count).to eq(9)
        expect(@jrr_tolkien.book_count).to eq(6)
      end
    end
  end
end

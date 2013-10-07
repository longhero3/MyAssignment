require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create :user }
  describe 'validation' do 
    it{ should have_many :book_categories}
    it{ should have_many(:books).through(:book_categories)}
    it{ should validate_presence_of :name}
    it{ should validate_uniqueness_of :name}
    it{ should validate_presence_of :sort_order}
    it{ should validate_uniqueness_of :sort_order}
  end
end

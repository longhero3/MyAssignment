require 'spec_helper'

describe Book do

  let(:book) { FactoryGirl.create :book }
  books =  FactoryGirl.create_list(:book,20)
  describe 'validations' do
    it { should have_many(:comments)}
    it { should have_many(:order_lines)}
    it { should have_many(:book_categories)}
    it { should have_many(:categories).through(:book_categories)}
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :img_url}
    it { should validate_presence_of :price }
    it { should validate_presence_of :published_date }
    it { should validate_presence_of :publisher }
    it { should validate_presence_of :rating_count }
    it { should validate_presence_of :total_rating_value }
    it { should validate_numericality_of :price }

    it 'should accept only positive price' do
  	  book.price = -1.0
  	  book.should_not be_valid
  	  book.price = 0.01
  	  book.should be_valid
      book.price = 'twenty'
      book.should_not be_valid
    end

    it 'should have a valid image url' do
      book.img_url = 'two.gif'
      book.should be_valid
    end

    it 'should display error when image url is invalid' do
      book.img_url = 'two'
      book.should_not be_valid
    end
  end 

  it 'calculates average rating correctly' do
    book.rating_count = 3
    book.total_rating_value = 12
    expect(book.average_rating).to eq(4)
  end

  it 'calculates average rating with indivisible rating count' do
    book.rating_count = 3
    book.total_rating_value = 11
    expect(book.average_rating).to eq(3)
  end


end


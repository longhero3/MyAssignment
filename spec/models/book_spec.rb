require 'spec_helper'

describe Book do

  let(:book) { FactoryGirl.create :book }

  it 'should not be empty' do 
  	book.should be_valid
  end

  it 'should price must be positive' do
  	book.price = -1.0
  	book.should_not be_valid
  	book.price = 0.01
  	book.should be_valid
  end

  it { should have_many(:comments)}

  it { should have_many(:order_lines)}

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

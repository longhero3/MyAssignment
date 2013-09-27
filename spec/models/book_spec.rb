require 'spec_helper'

describe Book do

  let(:book) { FactoryGirl.create :book }

  it 'should not be empty' do 
  	book.should be_valid
  end

  it 'should price must be positice' do
  	book.price = -1.0
  	book.should_not be_valid
  	book.price = 0.01
  	book.should be_valid
  end

  it { should have_many(:comments)}

  it { should have_many(:order_lines)}

end

require 'spec_helper'

describe Book do

  let(:book) { FactoryGirl.create :book }

  it 'should not be empty' do 
  	book.should be_valid
  end
end

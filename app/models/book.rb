class Book < ActiveRecord::Base
  attr_accessible :title, :author, :description, 
  	:img_url, :price, :published_date, :publisher, 
  	:rating_count, :total_rating_value
  has_many :comments
  has_many :order_lines

  validates :title, :description, 
  	:img_url, :price, :published_date, 
  	:publisher, :rating_count, :total_rating_value, 
  	:presence => true
  validates :price, :rating_count, :total_rating_value,
  	:numericality => {:greater_than_or_equal_to => 0}
  validates :img_url, :format =>
  {
  	:with => %r{\.(gif|png|jpg)$}i,
  	:message => 'Must be gif, pnj or jpg image'
  }

  paginates_per 5

  # validates :happened_at_is_valid_datetime

  # def happened_at_is_valid_datetime
  #   errors.add(:published_date, 'must be a valid datetime') if ((DateTime.parse(published_date) rescue ArgumentError) == ArgumentError)
  # end

end

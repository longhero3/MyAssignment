class Book < ActiveRecord::Base
  attr_accessible :title, :author, :description, 
  	:img_url, :price, :published_date, :publisher, 
  	:rating_count, :total_rating_value

  has_many :comments
  has_many :order_lines, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  has_many :categories, through: :book_categories

  before_destroy :ensure_not_referenced_by_any_order_item

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

  # validates :happened_at_is_valid_datetime

  # def happened_at_is_valid_datetime
  #   errors.add(:published_date, 'must be a valid datetime') if ((DateTime.parse(published_date) rescue ArgumentError) == ArgumentError)
  # end
  def is_commented(user_id)
    comment=comments.find_by_user_id(user_id)
    if comment
      return true
    else
      return false
    end
  end

  class << self
    def search(input)
      if input
        where('LOWER(title) LIKE LOWER(?) OR LOWER(author) LIKE LOWER(?)', "%#{input}%", "%#{input}%")
      else
        scoped
      end
    end
  end

  def average_rating
    average = total_rating_value / rating_count
  end

  private

  def ensure_not_referenced_by_any_order_item
    if order_lines.empty?
      return true
    else
      errors.add(:base, 'Order Lines present')
      return false
    end
  end

  

end

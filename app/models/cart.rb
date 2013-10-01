class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :order_lines, dependent: :destroy

  def add_book(book_id)
  	current = order_lines.find_by_book_id(book_id)
  	if current
  		current.quantity += 1
  	else
  		current = order_lines.build(book_id: book_id)
  		current.quantity = 1
  	end
  	current
  end

  def total_price
  	order_lines.to_a.sum {|item| item.total_price }
  end
end

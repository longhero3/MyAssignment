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
      current.update_attributes(:unit_price => current.book.price)
  	end
  	current
  end

  def minus_quantity(book_id)
    current = order_lines.find_by_book_id(book_id)
    if current.quantity > 1
      current.quantity -= 1
    else
      current.destroy
    end
    current
  end

  def total_price
  	order_lines.to_a.sum {|item| item.total_price }
  end
end

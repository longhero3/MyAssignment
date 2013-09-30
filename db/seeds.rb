# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.delete_all
Book.create(
  :title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Henry J.',
  :publisher => 'James Moriaty',
  :published_date => '23/09/2000',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp0.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Ruby Programming',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'June Lee',
  :publisher => 'Lawrence',
  :published_date => '12/02/2013',
  :total_rating_value => 8,
  :rating_count => 2,
  :img_url =>   'temp1.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Java Programming',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Denis',
  :publisher => 'Harmance',
  :published_date => '22/22/1999',
  :total_rating_value => 2,
  :rating_count => 1,
  :img_url =>   'temp2.jpg',    
  :price => 500.23)
# . . .
Book.create(
  :title => 'Styling with CSS3',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Sam H.',
  :publisher => 'Lina',
  :published_date => '13/09/1991',
  :total_rating_value => 23,
  :rating_count => 12,
  :img_url =>   'temp3.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Introduction to Python',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Micheal A.',
  :publisher => 'Hermit',
  :published_date => '23/09/2000',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp4.jpg',    
  :price => 50.00)
# . . .
Book.create(
  :title => 'How to make a good disk',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'James Cook',
  :publisher => 'Healthy Life',
  :published_date => '23/09/2000',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp5.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Workplace preparation',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Jack',
  :publisher => 'Joe I.',
  :published_date => '23/09/2000',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp6.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Harry Potter and The Secret Chamber',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'J.K Rowling',
  :publisher => 'Unknown',
  :published_date => '23/09/2000',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp7.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Harry Potter and The Prisoner of Askaban',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'J.K Rowling',
  :publisher => 'Unknown',
  :published_date => '23/09/2000',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp8.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'How to be successful in your career',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Joane L.',
  :publisher => 'Business Theory',
  :published_date => '23/09/2000',
  :total_rating_value => 0,
  :rating_count => 0,
  :img_url =>   'temp9.jpg',    
  :price => 20.98)
# . . .
Book.create(
  :title => 'Harry Potter and The Orders of The Pheonix',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'J.K Rowling',
  :publisher => 'Unknown',
  :published_date => '12/09/2005',
  :total_rating_value => 12,
  :rating_count => 4,
  :img_url =>   'temp10.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'Introduction to Information System',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Henry J.',
  :publisher => 'James Moriaty',
  :published_date => '23/09/2000',
  :total_rating_value => 0,
  :rating_count => 0,
  :img_url =>   'temp11.jpg',    
  :price => 12.95)
# . . .
Book.create(
  :title => 'Programming Standard IS',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Nancy N.',
  :publisher => 'Local Pub',
  :published_date => '31/01/2000',
  :total_rating_value => 1,
  :rating_count => 1,
  :img_url =>   'temp12.jpg',    
  :price => 42.95)
# . . .
Book.create(
  :title => 'MS Office for beginner',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Mdoas',
  :publisher => 'Yolo',
  :published_date => '23/09/2000',
  :total_rating_value => 1,
  :rating_count => 1,
  :img_url =>   'temp13.jpg',    
  :price => 1.95)
# . . .
Book.create(
  :title => 'It is nothing to overcome',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :author => 'Henry J.',
  :publisher => 'James Moriaty',
  :published_date => '23/09/2000',
  :total_rating_value => 2,
  :rating_count => 2,
  :img_url =>   'temp14.jpg',    
  :price => 4.12)
# . . .
Category.delete_all
Category.create(
  :name => 'Technology',
  :sort_order => 'title')
# . . .
Category.create(
  :name => 'Fiction',
  :sort_order => 'title')
# . . .
Category.create(
  :name => 'Business',
  :sort_order => 'title')
# . . .
Category.create(
  :name => 'Entertainment',
  :sort_order => 'title'
)
# . . .
Category.create(
  :name => 'Comic',
  :sort_order => 'title'
)
# . . .
Category.create(
  :name => 'All',
  :sort_order => 'title'
)
# . . .



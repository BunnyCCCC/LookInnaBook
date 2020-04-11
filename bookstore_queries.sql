/*create view for total sales report*/
create view total_sales as
  select isbn,ord_quantity,price,profit_share_percentage,order_date
  from bookorder natural join has as A natural join book
  where A.ISBN = book.ISBN;

/*create view for total expenditure report*/
create view total_exp as
  select pb_name, sum(expenses) as expenses, pay_date
  from pay natural join book as B natural join publisher
  group by pb_name, pay_date


/*create view sales_by_ISBN report grouped by ISBN and order_date*/
create view sales_by_ISBN as
  select isbn,sum(ord_quantity*price) as S, order_date
  from bookorder natural join has as A natural join book
  group by ISBN, order_date


/*create view sales_by_genre report grouped by genre and order_date*/
create view sales_by_genre as
  select genre,sum(ord_quantity*price) as S, order_date
  from bookorder natural join has as A natural join book
  group by genre, order_date


/*create view sales_by_author report grouped by bookauthor and order_date*/
create view sales_by_author as
  select author,sum(ord_quantity*price) as S, order_date
  from bookorder natural join has as A natural join book
  group by author, order_date

/*create view sales_by_publisher report grouped by publisher name and order_date*/
create view sales_by_pb_name as
  select pb_name,sum(ord_quantity*price) as sales, order_date
  from bookorder natural join has as A natural join book as B natural join publisher
  group by pb_name, order_date

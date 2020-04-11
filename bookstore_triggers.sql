/*if the stock is greater than or equal to the new order request amount, the tracking number will be generated*/

create trigger shipped_trigger after insert on bookorder
  for each row execute function instockCheck();
/*once the shipment is inserted, and tracking number appears, the expense is recorded to pay the publisher*/

create trigger pay_trigger after insert on bookorder
  for each row execute function updateExp();

/*if the order is placed, the stock is automatically deduct from the warehouse*/
create trigger stock_trigger after insert on bookorder
  for each row execute function updateSto();


/*create the trigger to stock certain book id the current stock is below 5 books of that kind*/
create trigger restock_trigger after update on stock
  for each row execute function reStock();

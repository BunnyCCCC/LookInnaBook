/*genereate random tracking number (12 digit)*/

create or replace function random_bt(l bigint ,h bigint) returns bigint as $r$
   begin
    return floor(random()* (h-l + 1) + l);
   end;
$r$ language 'plpgsql';

/*if the stock is greater than or equal to the new order request amount, the tracking number will be generated*/
create or replace function instockCheck() returns trigger as $table$
  begin
    insert into shipment(order_id,WH_id,tracking_num) values (new.order_id,5001,random_bt(100000000000,999999999999));
    return new;
  end;
$table$ LANGUAGE plpgsql;


/*if the order is placed, the pay to the publisher will be inserted same as the order_date.*/
create or replace function updateExp() returns trigger as $s$
  declare
    p      numeric(10,0);
    d      date;
    e      numeric(6,2);
  begin
      select pb_id, order_date, sum(price * ord_quantity * profit_share_percentage) into p,d,e
      from book natural join has as A natural join bookorder
      where basket_id = new.basket_id
      group by pb_id,order_date;

      insert into pay(admin_id,pb_id,expenses,pay_date,transac_num) values (0,p,e,d,random_bt(10007,99999));
    return new;
  end;
$s$ LANGUAGE plpgsql;


/*if the order is placed, the stock is automatically deduct from the warehouse*/
/*if the order requested amount of book is greater than the stock in the warehouse, the warehouse will ask for supply first
then updated the stock */
create or replace function updateSto() returns trigger as $st$

  begin
    select ISBN, ord_quantity
    from bookorder natural join basket as A natural join has
    where A.basket_id = has.basket_id;

    if(stock.sto_quantity - new.ord_quantity >=0) then
      update stock set sto_quantity = stock.sto_quantity - new.ord_quantity;
    elseif(stock.sto_quantity - new.ord_quantity >=0) then
      update supplied_by set sup_quantity = supplied_by.sup_quantity + 20;
      update stock set sto_quantity = stock.sto_quantity + 20 - new.ord_quantity;

    end if;
    return new;
  end;
$st$ LANGUAGE plpgsql;


/*create the trigger to stock certain book id the current stock is below 5 books of that kind*/
create or replace function reStock() returns trigger as $rs$
  begin
    select ISBN, sto_quantity
    from stock
    where ISBN = new.ISBN;

    if(stock.sto_quantity<5) then
        update supplied_by set sup_quantity = supplied_by.sup_quantity + 20;
        update stock set sto_quantity = new.sto_quantity + 20;
    end if;
    return new;
  end;
$rs$ LANGUAGE plpgsql;

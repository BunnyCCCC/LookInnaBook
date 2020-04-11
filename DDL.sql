create table store_manager(
	admin_id	 	numeric(4,0) NOT NULL,
	adm_username	varchar(15) NOT NULL,
	adm_passwd		varchar(10) NOT NULL,
	primary key	(Admin_id)
);

create table basket(
	basket_id	 numeric(10,0) NOT NULL,
	primary key (basket_id)
);


create table warehouse(
	WH_id		numeric(4,0) NOT NULL,
	WH_name		varchar(30) NOT NULL,
	WH_address	varchar(50),
	WH_phone	numeric(10,0),
	WH_email	varchar(30),
	primary key (WH_id)
);

create table publisher(
	pb_id			numeric(10,0) NOT NULL,
	pb_name			varchar(30)	NOT NULL,
	pb_address		varchar(50),
	pb_email		varchar(30) NOT NULL,
	pb_phone		numeric(10,0),
	pb_banking_acc	numeric(12,0) NOT NULL,
	primary key (pb_id)
);

create table book(
	ISBN						numeric(13,0) NOT NULL,
	b_name						varchar(100) NOT NULL,
	author						varchar(30),
	genre						varchar(20) NOT NULL,
	pb_id						numeric(10,0) NOT NULL,
	pages						numeric(10,0) check (pages > 0),
	price						numeric(6,2) check (price > 0),
	profit_share_percentage		numeric(3,2) check (profit_share_percentage > 0.00 and profit_share_percentage < 0.60),
	primary key (ISBN),
	foreign key (pb_id) references publisher on delete cascade
);

create table customer(
	customer_id		numeric(10,0) NOT NULL,
	cust_name		varchar(20) NOT NULL,
	cust_email		varchar(30) NOT NULL,
	cust_address	varchar(50),
	cust_username	varchar(15) NOT NULL,
	cust_passwd		varchar(10) NOT NULL,
	primary key	   (customer_id)
);

create type credit_card as(
	cc_num			numeric(16,0),
	cc_name			varchar(20),
	cc_expiry		numeric(4,0),
	cvv				numeric(3,0)
);
create table bookorder(
	order_id			numeric(10,0) NOT NULL,
	order_date			date check(order_date > '2020-01-01') default '2020-01-01',
	amount				numeric(6,2) check(amount > 0.00),
	basket_id	 		numeric(10,0) NOT NULL,
	customer_id			numeric(10,0) NOT NULL,
	shipping_address	varchar(50) NOT NULL,
	billing_info		credit_card NOT NULL,
	primary key		   (order_id),
	foreign key	       (basket_id) references basket on delete cascade,
	foreign key		   (customer_id) references customer on delete cascade
);

create table placed_by(
	customer_id		numeric(10,0) NOT NULL,
	basket_id	 	numeric(10,0) NOT NULL,
	primary key    (customer_id, basket_id),
	foreign key    (customer_id) references customer on delete cascade,
	foreign key	   (basket_id) references basket on delete cascade
);

create table supplied_by(
	pb_id			numeric(10,0) NOT NULL,
	ISBN			numeric(13,0) NOT NULL,
	sup_quantity	numeric(3,0) check (sup_quantity > 0),
	primary key	   (pb_id,ISBN),
	foreign key    (pb_id) references publisher on delete cascade,
	foreign key    (ISBN) references book on delete cascade
);

create table stock(
	ISBN			numeric(13,0) NOT NULL,
	WH_id			numeric(4,0) NOT NULL,
	sto_quantity	numeric(3,0) check(sto_quantity > 0),
	primary key    (ISBN, WH_id),
	foreign key	   (ISBN) references book on delete cascade,
	foreign key	   (WH_id) references warehouse

);

create table pay(
	admin_id	 	numeric(4,0) NOT NULL,
	pb_id			  numeric(10,0) NOT NULL,
	expenses		numeric(8,2) default 0.00,
  pay_date    date check(order_date > '2020-01-01') default current_date,
  transac_num numeric(5,0) NOT NULL default 0,
	primary key    (admin_id,pb_id,pay_date,transac_num),
	foreign key	   (admin_id) references store_manager,
	foreign key	   (pb_id) references publisher on delete cascade
);

create table shipment(
	order_id			numeric(10,0) NOT NULL,
	WH_id				  numeric(4,0) NOT NULL,
	tracking_num		numeric(12,0),
	primary key 	   (order_id, WH_id),
	foreign key 	   (order_id) references bookorder on delete cascade,
	foreign key	       (WH_id) references warehouse
);

create table has(
	ISBN			numeric(13,0) NOT NULL,
	basket_id	 	numeric(10,0) NOT NULL,
	ord_quantity	numeric(2,0) check(ord_quantity > 0),
	primary key	   (ISBN,basket_id),
	foreign key	   (ISBN) references book on delete cascade,
	foreign key    (basket_id) references basket on delete cascade
);

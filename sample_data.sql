delete from basket;
delete from book;
delete from bookorder;
delete from customer;
delete from has;
delete from pay;
delete from placed_by;
delete from publisher;
delete from shipment;
delete from stock;
delete from store_manager;
delete from supplied_by;
delete from warehouse;

insert into basket values ('1000000001');
insert into basket values ('1000000002');
insert into basket values ('1000000003');
insert into basket values ('1000000004');
insert into basket values ('1000000005');

insert into publisher values ('2000000001','Macmillan Publisher Ltd','Equitable Building,NYC,US','account@macmillaneducation.com','2025550168','701790090816');
insert into publisher values ('2000000002','Simon & Schuster','Simon & Schuster Building,NYC,US','account@simonschuster.com','2025550721','447419435139');
insert into publisher values ('2000000003','Wentworth Press','343 Sussex Street,Sydney,Australia','account@wentworth.com','0491571156','952814395467');
insert into publisher values ('2000000004','University of Chicago Press','1427 E 60th St,Chicago,IL,US','account@chicagouniversity.com','3025550791','285265673590');
insert into publisher values ('2000000005','Adriadne Press','270 Goins Court,Riverside,CA,US','account@adriadnepress.com','6192225457','547365701698');
insert into publisher values ('2000000006','HarperCollins Publishers','195 Broadway,NYC,NY,US','account@harpercollins.com','2023994721','362917099123');
insert into publisher values ('2000000007','Penguin Books Ltd','80 Strand London WC2R 0RL,UK','account@penguinbooks.com','2079460331','168010269865');
insert into publisher values ('2000000008','St Martin"s Press','120 Broadway,NYC,NY,US','account@stmartinspress.com','202717877','814869441449');
insert into publisher values ('2000000009','Lonely Planet Global Limited','124 Linden Street,Oakland,CA,US','account@lonelyplanet.com','6192790581','667658656876');


insert into book values ('9780025486508', 'Gone with the Wind', 'Margaret Mitchell','Fiction','2000000001','441','14.99','0.20');
insert into book values ('9781416500360', 'The Odyssey', 'Homer','Poetry','2000000002','416','8.50','0.25');
insert into book values ('9781371628666', 'Twelfth Night', 'William Shakespeare','Drama','2000000003','116','17.95','0.29');
insert into book values ('9780226771250', 'The Robot"s Rebellion : Finding Meaning in the Age of Darwin', 'Keith E. Stanovich','Non-Fiction','2000000004','374','23.5','0.41');
insert into book values ('9781572410671', 'Decisive Moments in History', 'Stefan Zweig','Non-Fiction','2000000005','254','24.14','0.33');
insert into book values ('9780007516704', 'A Modern Way to Eat', 'Anna Jones','Cookbook','2000000006','400','43.13','0.55');
insert into book values ('9780140446197', 'The Metaphysics', 'Aristotle','Anthologies','2000000007','528','21.60','0.47');
insert into book values ('9780140455113', 'The Republic', 'Plato','History','2000000007','480','22.15','0.19');
insert into book values ('9781250196620', 'How to Think Like a Roman Emperor : The Stoic Philosophy of Marcus Aurelius', 'Donald Robertson','Philosophy','2000000008','304','39.73','0.54');
insert into book values ('9781787014398', 'Lonely Planet Best of Iceland', 'Lonely Planet','Travel','2000000009','300','30.81','0.57');

insert into customer values ('4000000001','Oliver Neal','oliver_n@gmail.com','3120 Fourth Avenue,Calgary,AB,T2P 0H3','ollie','ollie');
insert into customer values ('4000000002','Tala Campos','talacampos@hotmail.com','7503 Rue St Denis Montreal QC H2R 2E7','talapos','talapos');
insert into customer values ('4000000003','Karso Goulding','karso_goulding@yahoo.ca','1445 Bank St,Ottawa,ON,K1H 7Z1','KGoulding','KGoulding');

insert into bookorder values ('3000000001','2020-02-01','422.78','1000000001','4000000001','806 Fourth Avenue,Calgary,AB,T2P 0H3',ROW('4532865574189739','Oliver Neal','0923','088'));
insert into bookorder values ('3000000002','2020-02-13','162.97','1000000002','4000000001','2765 Adelaide St,Toronto,ON,M5H 1P6',ROW('4532865574189739','Oliver Neal','0923','088'));
insert into bookorder values ('3000000003','2020-02-04','318.91','1000000003','4000000002','4961 rue Saint-Charles,Longueuil,QC,J4H 1M3',ROW('5453871787441000','Tala Campos','0721','014'));
insert into bookorder values ('3000000004','2020-02-27','25.50','1000000004','4000000002','4961 rue Saint-Charles,Longueuil,QC,J4H 1M3',ROW('5453871787441000','Tala Campos','0721','014'));
insert into bookorder values ('3000000005','2020-02-08','51.63','1000000005','4000000003','1445 Bank St,Ottawa,ON,K1H 7Z1',ROW('4556430532371787','Karso Goulding','1122','067'));

insert into has values ('9780025486508','1000000001','5');
insert into has values ('9781787014398','1000000001','10');
insert into has values ('9781416500360','1000000003','2');
insert into has values ('9781250196620','1000000002','1');
insert into has values ('9781250196620','1000000001','1');
insert into has values ('9781416500360','1000000004','3');
insert into has values ('9780007516704','1000000003','7');
insert into has values ('9781787014398','1000000002','4');
insert into has values ('9781416500360','1000000005','1');
insert into has values ('9780007516704','1000000005','1');

insert into store_manager values ('0000000000','admin', 'admin');

insert into pay values ('0000000000','2000000001','14.99','2020-02-01');
insert into pay values ('0000000000','2000000002','12.75','2020-02-27');
insert into pay values ('0000000000','2000000003','0','2020-01-01');
insert into pay values ('0000000000','2000000004','0','2020-01-01');
insert into pay values ('0000000000','2000000005','0','2020-01-01');
insert into pay values ('0000000000','2000000006','189.77','2020-02-08');
insert into pay values ('0000000000','2000000007','0','2020-01-01');
insert into pay values ('0000000000','2000000008','42.91','2020-02-13');
insert into pay values ('0000000000','2000000009','245.86','2020-02-13');

insert into placed_by values ('4000000001','1000000001');
insert into placed_by values ('4000000001','1000000002');
insert into placed_by values ('4000000002','1000000003');
insert into placed_by values ('4000000002','1000000004');
insert into placed_by values ('4000000003','1000000005');

insert into warehouse values ('5001','warehouse_1', '1350 Golden Line Rd,Almonte,ON,K0A 1A0','6138690578','warehouse1@lookinnabook.com');

insert into shipment values ('3000000001','5001','301202373251');
insert into shipment values ('3000000002','5001','503826913855');
insert into shipment values ('3000000003','5001','645607543844');
insert into shipment values ('3000000004','5001','329546852772');
insert into shipment values ('3000000005','5001','853769941261');

insert into stock values ('9780025486508','5001', '15');
insert into stock values ('9781416500360','5001', '14');
insert into stock values ('9781371628666','5001', '20');
insert into stock values ('9780226771250','5001', '20');
insert into stock values ('9781572410671','5001', '20');
insert into stock values ('9780007516704','5001', '12');
insert into stock values ('9780140446197','5001', '20');
insert into stock values ('9780140455113','5001', '20');
insert into stock values ('9781250196620','5001', '18');
insert into stock values ('9781787014398','5001', '6');


insert into supplied_by values ('2000000001','9780025486508', '20');
insert into supplied_by values ('2000000002','9781416500360', '20');
insert into supplied_by values ('2000000003','9781371628666', '20');
insert into supplied_by values ('2000000004','9780226771250', '20');
insert into supplied_by values ('2000000005','9781572410671', '20');
insert into supplied_by values ('2000000006','9780007516704', '20');
insert into supplied_by values ('2000000007','9780140446197', '20');
insert into supplied_by values ('2000000007','9780140455113', '20');
insert into supplied_by values ('2000000008','9781250196620', '20');
insert into supplied_by values ('2000000009','9781787014398', '20');

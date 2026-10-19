BEGIN TRANSACTION;

-- Categories (Replicated)
INSERT INTO categories (name, description, parent_category_id) VALUES ('Electronics', 'Score each cause. Quality throughout beautiful instead.
Despite measure ago current.', NULL);
INSERT INTO categories (name, description, parent_category_id) VALUES ('Smartphones', 'Stop peace technology officer relate. Product significant world. Term herself law street class.', (SELECT category_id FROM categories WHERE name = 'Electronics'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Laptops', 'Then fire pretty how trip learn enter. Seat much section investment on.', (SELECT category_id FROM categories WHERE name = 'Electronics'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Audio', 'Seem shoulder future fall citizen about reveal. Will seven medical blood personal.', (SELECT category_id FROM categories WHERE name = 'Electronics'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Clothing', 'She campaign little near enter their institution. Up sense ready require human.', NULL);
INSERT INTO categories (name, description, parent_category_id) VALUES ('Men''s Apparel', 'Best issue interest level. Pull worker better.', (SELECT category_id FROM categories WHERE name = 'Clothing'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Women''s Apparel', 'Magazine degree husband around her world. Unit size expect recent room.', (SELECT category_id FROM categories WHERE name = 'Clothing'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Footwear', 'Price north first end prove fire. How public feel first sell.
Leader your you. Mrs media car give.', (SELECT category_id FROM categories WHERE name = 'Clothing'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Home & Kitchen', 'Choice example decision garden reach table measure. Town suffer begin interest everybody.', NULL);
INSERT INTO categories (name, description, parent_category_id) VALUES ('Furniture', 'Away third tough nation.', (SELECT category_id FROM categories WHERE name = 'Home & Kitchen'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Cookware', 'Agent say forward us soon ten. Environment skin blue the teach.', (SELECT category_id FROM categories WHERE name = 'Home & Kitchen'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Decor', 'Go meeting quickly such former. Boy wife condition.', (SELECT category_id FROM categories WHERE name = 'Home & Kitchen'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Books', 'Mind southern rather. Hair attorney professional form finish. Rest feel finally impact.', NULL);
INSERT INTO categories (name, description, parent_category_id) VALUES ('Fiction', 'List top somebody college be middle plan. Behavior weight dog financial southern challenge.', (SELECT category_id FROM categories WHERE name = 'Books'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Non-Fiction', 'Imagine my indeed deal information toward. Watch affect thing offer local wall fear hope.', (SELECT category_id FROM categories WHERE name = 'Books'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Children''s', 'Here deep force seven here.', (SELECT category_id FROM categories WHERE name = 'Books'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Sports', 'Record short cold parent security boy standard. Blue agent find quality when.', NULL);
INSERT INTO categories (name, description, parent_category_id) VALUES ('Outdoor', 'Something future they red everybody act. Beat result major serve real.', (SELECT category_id FROM categories WHERE name = 'Sports'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Fitness', 'Right with modern executive beyond. Fast guess few remain call. Window network recently.', (SELECT category_id FROM categories WHERE name = 'Sports'));
INSERT INTO categories (name, description, parent_category_id) VALUES ('Team Sports', 'Yes budget share paper. Difficult mission late kind team wrong figure perform.', (SELECT category_id FROM categories WHERE name = 'Sports'));

-- Suppliers (Replicated)
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Martin LLC', 'Samantha Morse', '217.846.4887x719', 'cassandra01@example.org', 'USS Key
FPO AP 35826');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Williams, Avila and Ruiz', 'Sydney White', '001-367-417-5655', 'robert74@example.net', 'USS Gibson
FPO AA 33583');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Wilson-Barton', 'Samantha Smith', '+1-976-203-8597', 'josephanderson@example.com', '09324 Andrea Course Apt. 171
South Sarah, LA 67199');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Hill, Davenport and Baird', 'Juan Reyes', '+1-982-414-6584x044', 'wryan@example.com', '5339 Hall Trail Suite 057
Hughesberg, NM 05353');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Shaw PLC', 'Brian Kirk', '687-702-6217', 'vsantos@example.net', '7809 Jimmy Spur Suite 316
Port Cynthiaville, NV 22306');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Evans, Johnson and Nguyen', 'Ian Jordan', '886.592.2219', 'jdurham@example.org', '4074 Charles Key Suite 647
Jamesfurt, PR 63836');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Young PLC', 'Edward Lyons', '5647090974', 'danaoliver@example.net', '104 Johnson Lakes
North Renee, MD 98474');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Thompson-Anderson', 'Valerie Schmidt', '724-374-5171x236', 'ismith@example.org', '651 Thomas River Suite 931
Blankenshipport, SD 54017');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Taylor Inc', 'Johnathan Davis', '+1-826-375-8692', 'rgilbert@example.org', '7351 Stephens Rue
Bruceview, ID 16512');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Davis-Lewis', 'Tricia Williams', '232-693-1839x33529', 'vanessafernandez@example.org', '05395 Grant Center
Lake Robert, DE 98236');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Alvarez LLC', 'Ashley Gordon', '+1-908-347-0076x617', 'morriseddie@example.org', '9847 Garcia Squares Apt. 836
Beasleychester, MA 59942');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Perry-Davis', 'Maurice Brooks', '(471)211-1615', 'elizabeth65@example.net', 'USCGC Parrish
FPO AP 07244');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Burke-Bell', 'Christy Douglas', '815.285.1493', 'anthony44@example.com', '96120 Julie Forge
Barnesmouth, GA 49004');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Griffith-Frank', 'Angela Williams', '(990)814-7679', 'jason81@example.com', '978 Williams Locks Apt. 034
Port Derrick, KS 38439');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Wilson-Jimenez', 'Carl Patel', '988.351.6060', 'barbara96@example.net', '60529 Collier Lake Apt. 613
Chapmanhaven, CO 52374');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Reese-Walker', 'Angela Schultz', '383.455.2312x43292', 'kmarshall@example.net', '527 Taylor Roads Suite 490
Williamport, NH 59734');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Brown LLC', 'Sean Wyatt', '+1-998-467-9807x935', 'hayeslisa@example.com', 'Unit 1820 Box 3778
DPO AP 80429');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Cox LLC', 'Raymond Shelton', '4517518644', 'aguilardonald@example.com', '91486 Li Skyway Apt. 685
West Kyleborough, MA 64237');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Perez and Sons', 'Edward French', '988.205.9296x22292', 'udiaz@example.org', 'Unit 9473 Box 8347
DPO AE 48714');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Valentine, Joyce and Murray', 'James Rose', '(339)324-0758', 'christopher24@example.com', 'PSC 2613, Box 7506
APO AE 52465');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Brooks, Hughes and Miller', 'Fernando Garcia', '001-352-220-4727x790', 'jason28@example.net', '43410 Robert Underpass Suite 117
Lake Zacharybury, VT 19319');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Patterson-Mendez', 'Jason Beck', '285-818-8888', 'ywilliams@example.com', '1531 Anderson Knoll
Lisaburgh, MP 90243');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Pollard-Mendoza', 'Chad Baldwin', '904.630.3054x868', 'mullinsjames@example.com', '541 Kim Locks
Klinefurt, MA 24987');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Holt-Richardson', 'Debra Miller', '(816)492-8451x15447', 'cbell@example.net', '640 Emily Lodge Suite 820
Port Cathy, WY 57933');
INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES ('Martinez and Sons', 'Holly Reyes', '001-409-727-5571', 'redwards@example.org', 'USS Fitzgerald
FPO AA 68362');

-- Warehouses (Replicated)
INSERT INTO warehouses (name, address, city, state, zip_code) VALUES ('Mcintyre-Wilson DC', '739 Benson Overpass Apt. 121', 'Thompsonmouth', 'CO', '89882');
INSERT INTO warehouses (name, address, city, state, zip_code) VALUES ('Contreras-Mckinney DC', '2258 David Flats Apt. 370', 'Angelastad', 'NH', '72806');
INSERT INTO warehouses (name, address, city, state, zip_code) VALUES ('Salazar Inc DC', '6786 Morrow Cliffs', 'West Dawn', 'NV', '61558');
INSERT INTO warehouses (name, address, city, state, zip_code) VALUES ('Holmes, Anderson and Calderon DC', '68018 Kevin Estates', 'Sarahbury', 'MI', '68513');
INSERT INTO warehouses (name, address, city, state, zip_code) VALUES ('Singleton-King DC', '49818 Brittany Prairie Apt. 299', 'Meganshire', 'AZ', '04219');
INSERT INTO warehouses (name, address, city, state, zip_code) VALUES ('Williams Ltd DC', '396 Tyler Road Suite 473', 'Evansland', 'UT', '08353');

-- Coupons (Replicated)
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('SAVE10', 'Senior site turn.', 'Percentage', 5.63, '2026-08-19', '2026-10-18', 55);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('WELCOME20', 'Top continue goal before suffer walk we girl.', 'Percentage', 8.49, '2026-08-09', '2026-09-13', 33);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('FLASH15', 'Sit party measure attention standard shake more.', 'Percentage', 19.76, '2026-08-05', '2026-09-28', 24);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('SUMMER5', 'Commercial senior above rise under.', 'Percentage', 10.47, '2026-08-08', '2026-08-29', 84);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('WINTER10', 'Hand operation keep whatever Congress great here.', 'Percentage', 19.03, '2026-09-07', '2026-11-04', 89);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('FREESHIP', 'Dinner both world buy book career several.', 'Percentage', 16.23, '2026-08-10', '2026-09-25', 55);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('VIP25', 'Reveal bank management his lead save reach.', 'Percentage', 22.45, '2026-08-17', '2026-09-06', 63);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('BOGO', 'Network fact talk country attorney.', 'Percentage', 10.38, '2026-09-02', '2026-10-09', 63);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('DEAL40', 'Conference your man black just probably.', 'Percentage', 14.5, '2026-09-05', '2026-10-01', 65);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('SAVE5', 'Century husband opportunity big.', 'Fixed', 21.14, '2026-07-29', '2026-09-09', 78);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('HOLIDAY', 'Hair current customer such.', 'Percentage', 29.33, '2026-08-06', '2026-09-29', 68);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('WEEKEND', 'Do interesting material share.', 'Fixed', 21.59, '2026-08-29', '2026-09-23', 99);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('EARLYBIRD', 'Event smile popular hundred live owner identify machine.', 'Percentage', 22.61, '2026-09-15', '2026-10-28', 25);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('LASTCHANCE', 'Should blue economy market.', 'Fixed', 24.7, '2026-08-17', '2026-09-20', 49);
INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES ('MEGA10', 'Between apply attention.', 'Fixed', 10.56, '2026-08-03', '2026-08-29', 66);

-- Products (Replicated)
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (1, 'Polo Shirt 46', 'Him quickly check perform.
Produce mind man letter. Product make energy gas teacher.
Weight all involve. Himself fire heavy least. Computer process single.', 222.14, 115.54, 6, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (2, 'Gigabyte Aero 82', 'Short expect article opportunity campaign hand. Agree through game best generation group goal product. Doctor fine be read than. Front after for leave.', 184.39, 134.26, 3, 6);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (3, 'Educated 35', 'Degree enter father of source person when. Behind front attack song little decide somebody prepare.
Sound item music customer I person law. Congress affect reflect television officer defense while.', 989.68, 680.9, 15, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (4, 'High Heels 42', 'Either over image box. Agree someone financial magazine yard.
Dark evening ahead. Probably compare system white magazine. Area to finish.
Too imagine guy price. However style successful door.', 845.36, 633.34, 8, 8);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (5, 'Nothing Phone 2 52', 'Television argue mouth record both. Interest radio white these view guy resource. Again whom paper success production.
Education his police red total.', 279.45, 138.31, 2, 19);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (6, 'Stainless Pot 84', 'Place these short image almost term. Likely include subject response theory star station.
At inside role natural force receive seven. Picture social carry husband.', 507.23, 404.82, 11, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (7, 'Deep Work 34', 'Phone trade wind cup red collection husband investment. Chance when color note add. Itself turn law purpose budget require course.', 153.39, 112.78, 15, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (8, 'Rice Cooker 75', 'Pay traditional hard range leader. Light the window.
Require remain save eight believe. Appear use likely great. Vote whose our security animal effect people few.', 437.57, 289.93, 9, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (9, 'Leather Boots 66', 'Unit executive theory party seven enough. Job close say man wear new.
Country approach consumer. Employee relationship job yet until American ground. Magazine manage suffer term buy behavior test.', 501.61, 371.24, 8, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (10, 'Cotton T-Shirt 88', 'Should quality thought ago race. Hour opportunity week student.
Ball store process. Pick especially price forget analysis performance laugh.', 431.4, 184.89, 5, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (11, 'Cricket Bat 68', 'Single expect sell pressure building make. Save TV tough page grow benefit.', 263.38, 170.92, 20, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (12, 'Audio Interface 69', 'Life bad soon feel worker. Success mission far answer baby.
Blue interesting behind produce nothing effect effort.', 754.85, 563.02, 4, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (13, 'Soundbar 56', 'Decision back word else. Its adult house actually. Least if price season rise field spend.', 171.62, 68.9, 4, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (14, 'Mixer 98', 'White likely teacher one cut notice. Anything account piece require woman support.', 191.78, 155.47, 9, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (15, 'Nightstand 65', 'Third rich hospital indicate. Somebody son suddenly perform executive see. Can current paper beyond indeed year field.
Another adult thing ground city still thus. Southern front box.', 615.22, 288.4, 10, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (16, 'Blazer 100', 'Prove relationship unit just lead success book black. Participant teach big none medical cold brother day. Church factor kid media run between.', 923.67, 751.24, 6, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (17, 'Cutting Board 3', 'Truth together weight might radio want. Certainly act south want be fire. Its hotel also two.
Around place require produce mind fast I. Them return finish general still too particular.', 126.07, 71.02, 11, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (18, 'Running Shoes 31', 'Yeah exist behavior necessary miss serious civil. Three music else.
Would book art health phone great. Series walk large.', 879.95, 726.95, 8, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (19, 'The Very Hungry Caterpillar 98', 'Better Republican stock bank artist thousand live. Back quality idea next single the once. You ready way rule indicate clear.', 540.17, 246.64, 16, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (20, 'Goodnight Moon 34', 'Agreement central six instead view figure exist. Standard major business give.
Loss finally laugh full help strong.', 535.22, 360.19, 16, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (21, 'Sleeping Bag 92', 'Popular be western my. Whatever miss seek. To build view conference affect skill early.', 322.72, 273.61, 18, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (22, 'Rug 67', 'Agree around hope floor. Throw election walk tonight appear dream. Only manage sell his boy art let imagine.
Imagine do though. Never only big several prepare. Fight image base player.', 460.25, 235.44, 12, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (23, 'Non-Stick Pan 76', 'Art two event. Style herself goal place one.
Animal school none feel house. Store rise your there. Particular whatever five radio garden.', 561.05, 372.98, 11, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (24, 'MacBook Pro 16 30', 'New recent major hotel ball theory. Much throughout staff knowledge.
Will heavy over hit stuff speech. By have cover.
Sea serve quite remember course.', 82.31, 34.09, 3, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (25, 'Razer Blade 31', 'Court question yeah realize mouth. Quite third ability interview pull. Take follow such.', 290.01, 179.35, 3, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (26, 'Raincoat 74', 'Culture forget as personal agreement. Space or phone free economy blue.
Strategy start mind door authority outside. Shake personal often beat art almost.', 481.1, 362.31, 5, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (27, 'Summer Dress 13', 'People fund visit situation law foreign court bill. Require or subject toward call meeting green loss. Know during someone art find job where senior.', 664.43, 371.7, 7, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (28, 'Atomic Habits 87', 'Crime customer training size game property. Outside former official white pattern industry class. Then treat many turn police really level.', 658.99, 455.22, 15, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (29, 'The Hobbit 44', 'Create one she analysis ahead cup. Despite energy company suggest.
Cultural compare energy big. Her skin book very.
Drive special produce wait with young think. Budget third capital couple.', 803.77, 361.03, 13, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (30, 'Cardigan 58', 'Material less focus hear reason resource. Listen ok point so power debate thus. Tell how fill thousand number very hear.', 153.93, 74.28, 7, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (31, 'Trainers 10', 'Family maybe national back. Unit better author although customer. Push economic seat shoulder suddenly.', 452.03, 356.02, 8, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (32, 'Studio Monitors 84', 'Dinner rich decide do only need. Reveal left social fine could show recently.
Last next hear officer campaign wall. Matter probably great.', 999.28, 775.65, 4, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (33, 'Leather Boots 53', 'Term woman daughter hospital move could board. While police fight commercial push concern step. Major cost attorney white exist do process attorney. Happy action force travel.', 493.86, 245.05, 8, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (34, 'Google Pixel 8 49', 'Ask human space moment travel these least. Although before position try get successful society.', 18.11, 10.43, 2, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (35, 'Bookshelf 90', 'Yet baby black short. Improve close debate and ago police. High second talk however action boy true.', 957.99, 812.32, 10, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (36, 'Goodnight Moon 25', 'Democratic recent student specific political respond to.
Know our any help cut. Hear draw before instead writer. Star quite as when benefit structure.', 307.95, 257.42, 16, 19);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (37, 'Camping Tent 96', 'Activity defense detail price everything perhaps. Attack despite feeling. Matter wrong Republican social two notice edge behind.', 324.58, 137.16, 18, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (38, 'Golf Club Set 21', 'Scene serious people art hear. Dark heart politics draw rise.
Care fish skin always social increase. Seek director run garden day. Trade professor eat.', 71.96, 45.23, 17, 6);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (39, 'Gigabyte Aero 9', 'Medical international level clearly culture. Computer eat experience large player even.
Week growth help likely. Measure same set standard soldier after. Into bar trade feel Mr need.', 680.4, 344.17, 3, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (40, 'Dumbbell Set 75', 'Identify indeed house score himself film would. Impact although TV his. Class several whatever side seem give remember.
Prepare unit save drug. Tv guess religious. Recently population end.', 601.0, 407.91, 19, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (41, 'Kettlebell 67', 'Reality may mouth though only. Sell under thank body of something. Especially decide security recognize.
Staff ability attorney recent.', 327.3, 169.33, 19, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (42, 'Stainless Pot 34', 'Phone person than coach fall help. Ask ahead doctor magazine set. Article seem account.', 405.44, 284.72, 11, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (43, 'Thinking Fast Slow 97', 'Own than evidence. Happy peace probably little including.
Worry whatever spend. Plant them wide.', 936.75, 378.63, 15, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (44, 'Yoga Mat 10', 'Collection land break production drive deep send. Black year ahead upon. Total short detail election live today.
Two plant man somebody. The use short over popular help.', 545.02, 342.08, 19, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (45, 'Wall Art 32', 'Mind own develop house. System firm staff father despite quite challenge. Certainly program soon reflect out.
Wrong but you religious long stock manager. Arrive special check respond summer various.', 379.6, 178.79, 12, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (46, 'Bed Frame 84', 'Wrong serious hospital month executive recent crime. Hour capital sell oil source sure report. Pressure officer kind lot today decide source.
Gun task big. Heavy work quickly collection.', 536.47, 375.82, 10, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (47, 'Nightstand 14', 'Read west present heart reality. Sing ten practice every. Happen build bar majority protect meeting.
Of of event seat some Congress machine popular.', 939.9, 432.76, 10, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (48, 'Audio Interface 71', 'Television receive accept language. But can deal claim none surface.
Woman media hair name.
Eat animal watch. Process knowledge officer reason mission. Paper member reach production and already.', 168.95, 89.0, 4, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (49, 'Stainless Pot 88', 'Lay war put vote century data. Run yet recent cover head price star painting.
First skin her who. Back by body nature at. Guy four event than.
Act help why her bit. Compare rock fill start.', 640.08, 332.07, 11, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (50, 'Juicer 7', 'Her save apply rise. Religious eat participant religious consumer worry.
Expert weight minute responsibility under director player. Water image fine bed. Baby drive behavior offer.', 106.81, 63.08, 9, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (51, 'iPhone 15 Pro 43', 'Couple story account interesting move generation yes product.
Amount large collection us shake tough company happen. Message weight institution here. Wide full quickly story surface tax.', 774.77, 532.04, 2, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (52, 'Thermal Underwear 57', 'Arm accept leave fear blue glass reveal. Great big man be method child. Tree according show economic. House federal into consider speech board just.', 558.84, 331.09, 6, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (53, 'Studio Monitors 89', 'Inside nearly son research. Seem sister hundred rise score stay.
Whatever society call general. Should door question.', 905.46, 584.49, 4, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (54, 'Kettlebell 19', 'Particularly country talk pick chance build husband. Wrong upon international pattern before.
Imagine fill plan discuss from look.', 438.9, 183.82, 19, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (55, 'Nothing Phone 2 27', 'Best add necessary technology. Guess special sea open painting draw.
Once beautiful blood picture own. Only treatment pressure.', 687.14, 481.08, 2, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (56, 'Climbing Rope 80', 'Thus large response treat attack industry. So cold ever whose face what article. Scientist however range that will.
Seek his single husband even contain. Occur option across up.', 753.48, 615.29, 18, 8);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (57, 'Cargo Shorts 53', 'Break possible plan win foot watch this. Reveal impact particularly foot arm.
Despite whole computer will Mr without.', 40.38, 29.54, 6, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (58, 'Catcher in the Rye 35', 'Financial those stage. Could century interview lawyer population I right case.
Between himself body add store various car show.
Voice outside society act. My stand system be.', 172.64, 123.54, 14, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (59, 'Motorola Edge 29', 'Center treatment agency interview challenge pretty. Tv range rather resource top. College body big what ground past brother.', 212.37, 172.72, 2, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (60, 'Dining Table 29', 'Usually specific represent baby able value. Sing chair challenge land. Spring both into risk certain follow camera.', 39.28, 19.13, 10, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (61, 'Juicer 9', 'Dog able yes admit. Listen card body treat guess support single.
Leave structure necessary use inside. Still argue case while region.', 967.41, 508.48, 9, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (62, 'Baseball Bat 87', 'Store indicate she like cell month we.
Reveal know population actually born art. Page community civil. Strategy quite then never stop try.', 981.44, 629.39, 17, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (63, 'Soundbar 23', 'Position crime board back owner suggest.
Executive must assume others series.
Necessary point allow especially with. And worry low answer behavior final wonder.', 587.29, 494.85, 4, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (64, 'Microphone 56', 'Only system face charge leg those behavior. This space pressure shoulder claim. Might rock prepare us game size fund.', 356.15, 268.5, 4, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (65, 'Rugby Ball 15', 'Value claim evidence guy. Author represent leave worry. Shake kind under vote will.
Guy expert important. True can happen suddenly weight health radio media. Theory yard amount within arm.', 395.02, 260.5, 20, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (66, 'Sony Xperia 1', 'Should current forget fish you main. Boy lawyer nation we certainly degree nothing.', 527.59, 402.51, 2, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (67, 'Skirt 56', 'Clearly glass industry little read. Whole join tree now. Night throw cup.', 84.84, 59.3, 7, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (68, 'Hockey Stick 85', 'Democratic decide course quickly western have. Administration to maybe test record power. Increase goal stock international wind from unit. Into computer organization myself high suddenly read.', 850.44, 615.62, 20, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (69, 'Tennis Racket 86', 'High crime light buy whose trial include. Account hear difference exist they enough. Pull above training allow ago so.', 417.85, 242.8, 17, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (70, 'Sleeping Bag 25', 'Brother officer hot several true study city. Data behavior join pick order agreement.', 429.71, 353.72, 18, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (71, 'Blazer 73', 'Book until but center. Thus behavior management guess stuff. Beyond somebody including main personal decision. Heart finish traditional speak conference act.', 312.12, 201.81, 6, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (72, 'Office Chair 27', 'Ahead age memory charge term boy describe foreign. Base reality call event current.
Remain present level speak job watch. Economic cup suffer response which.', 439.0, 290.18, 10, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (73, 'Cutting Board 57', 'Standard last threat when education important page theory. Good air conference follow so group authority. Head single business five action forget.', 451.08, 223.81, 11, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (74, 'Thermal Underwear 11', 'Instead buy commercial force him.
Expect popular task. Treatment expect success. Already mouth month front administration like.', 295.24, 206.29, 6, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (75, 'Non-Stick Pan 97', 'Difficult because right speech staff Mr. Various test employee. Book water avoid.', 247.1, 133.36, 11, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (76, 'Denim Jacket 6', 'Next their process same day back. Art actually democratic stand could bit decade.', 256.92, 157.7, 5, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (77, 'Surface Laptop 54', 'Environment live most goal. Until base issue character. Issue free kid have any him up.
Country computer every parent million. Race position where detail.
Offer draw mother.', 887.95, 585.21, 3, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (78, '1984 52', 'Behind me red. School system reach color race coach forward.
While program into again. Thing color set act goal. On major easy body standard note wrong.', 256.07, 178.03, 13, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (79, 'Earbuds 55', 'Simple tax total other both rate rock. Challenge improve detail. Ground all officer receive.', 231.33, 176.24, 4, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (80, 'Baseball Bat 7', 'Item lawyer why society. Body across until chair race. Whom perhaps professor field explain son administration. Design stay but.', 564.48, 458.84, 17, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (81, 'Deep Work 60', 'Usually eat question hit human tough throw.
Financial nor quickly follow official raise current career. Current figure father until leave contain site.', 672.89, 568.29, 15, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (82, 'Cutting Board 79', 'Tonight there apply suddenly call prove leg. Least approach area stop practice four best. Not real ten building once. School apply day century science manager difference.', 817.96, 655.52, 11, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (83, 'Climbing Rope 21', 'Listen strategy kitchen argue. Feel low contain dog.
Start race teacher pay it. Continue stand price. Memory record customer lose.
Where manage property hospital. Less spend challenge exist.', 747.75, 458.82, 18, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (84, 'Trainers 82', 'Give relationship hospital artist pretty. Pretty none least teach cause size. Type attention stuff low while.', 288.86, 216.63, 8, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (85, 'Sneakers 57', 'Two artist economy also seek kid. Paper subject type fly recognize help. News cultural make quickly different score its.', 92.23, 48.75, 8, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (86, 'Knife Set 70', 'Couple debate still may ground tonight table. Keep personal them notice. Site fear brother discover.', 95.28, 44.58, 11, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (87, 'Cotton T-Shirt 9', 'Daughter stage form serious. Dog authority way toward.
Wonder wear our partner ball necessary.
Rich bit market different go. Field sure will again area similar specific.', 424.22, 232.85, 5, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (88, 'The Great Gatsby 27', 'Animal soon their economic arm arm just. Analysis glass pretty each factor. Huge price prevent baby voice day relate spend.
Require walk sister fall president money. Five must bit get improve.', 835.55, 480.66, 14, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (89, 'Yoga Mat 98', 'Know difference here process mouth produce. Must girl ago. Senior from stock energy send describe agree rise.', 582.47, 358.01, 19, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (90, 'Bookshelf 54', 'Gun process site special part. Fill produce structure summer. Leg key letter whole lose such. Impact often bag today necessary.', 545.6, 398.61, 10, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (91, 'Loafers 29', 'Team oil among response article research else. Administration suddenly support music and.
Board medical both back daughter now. Author interview executive agency parent growth.', 284.56, 176.01, 8, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (92, 'Cast Iron Skillet 87', 'When yeah not young. Nature individual run summer month anything line modern.', 801.36, 581.69, 11, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (93, 'Raincoat 69', 'Discover still would understand each training. Program painting somebody game brother impact measure chance. Plan significant tonight then administration building enjoy.', 42.52, 24.55, 5, 19);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (94, 'Bluetooth Speaker 83', 'Piece scientist job serious record safe. Trouble view base time order have power here. Computer reveal evidence significant discussion manage.
Military modern meet up expect himself serious.', 437.74, 345.85, 1, 6);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (95, 'Xiaomi 14 49', 'Explain main difference college. Writer send under project cell.
Stuff senior agree total whether music sometimes. Major state hard.
Interview know call law truth respond try. Know it enjoy ten.', 338.11, 204.43, 2, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (96, 'Sapiens 97', 'Religious fire under item. Fish success produce there along play account. Only the detail cultural.
Machine cost market capital. Week tax see about. Make particularly report although.', 951.97, 561.38, 13, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (97, 'The Very Hungry Caterpillar 96', 'Despite while to shake. Wide foot production break let five.
Recent relate similar low source major. Reach ahead environmental Democrat surface important.', 546.78, 464.74, 16, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (98, 'High Heels 9', 'Form painting after reveal sort bed relate treatment. As any decision movement world study how. Face claim hear including need. Vote already after wait bill.', 784.72, 544.04, 8, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (99, 'External SSD 26', 'Story teacher size interesting sea. Ever dark enough prevent likely. Involve develop image everything expect.', 841.79, 572.08, 1, 8);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (100, 'Wool Sweater 86', 'College ten majority economic center pattern list. Set arrive management in scientist strong already.', 128.55, 106.25, 5, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (101, 'Juicer 48', 'Although interest color sort. Cause them industry across brother yet result. Mission past he practice center.', 181.09, 121.92, 9, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (102, 'Earbuds 21', 'Really Mrs former article light. At player third general.
Ever star test once figure.', 965.28, 433.07, 4, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (103, 'Bed Frame 87', 'Follow time appear. Southern international line few service drive hotel. Relationship great stuff first back painting.
Watch street represent style. Kid reason economy build tonight present concern.', 909.49, 517.4, 10, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (104, 'Summer Dress 76', 'Positive politics huge. Ever arm occur air responsibility.
Place make list themselves seek space although ahead. Relationship computer surface bar. Argue PM artist best.', 695.55, 474.55, 7, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (105, 'Nightstand 77', 'Common and part read. Common section study about event go.
Nothing recent not leg break bed role. Fish phone after college. Design hear ball.', 808.63, 613.19, 10, 19);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (106, 'Nothing Phone 2 69', 'Including structure evening current without else. Enough majority official give politics last. Reach color wear one choose notice year its.', 437.51, 247.96, 2, 17);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (107, 'Non-Stick Pan 54', 'Only head help open almost red picture. City little from.
Tree fill level control. Keep pattern order.', 825.16, 369.25, 11, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (108, 'Deep Work 56', 'Whole wall cup win sell candidate four whether. Finally she soon learn.
A challenge third feeling ball door data. Right child new simply.
City beyond near hour defense line heavy.', 189.31, 120.17, 15, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (109, 'Mixer 69', 'Particular seem trip. Catch could deep itself fund. International expect hit start.
When instead clear radio strong.', 778.24, 474.1, 9, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (110, 'Resistance Bands 42', 'Southern traditional maybe sit Republican such will born. Wonder mother himself push.
Front various opportunity. Method pass the itself let.
Test least anyone out.', 854.08, 660.91, 19, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (111, 'Toaster 32', 'Issue ever will ready each stay strong. Notice American force although participant rich speech.
Mention rise front PM few husband. Wear either present third.', 754.46, 495.25, 9, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (112, 'Sapiens 4', 'Above debate site price ever. Out wish fish determine adult foot as.
Step onto play forget home upon actually future. State charge take material mother color.', 502.39, 274.43, 13, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (113, 'Skirt 34', 'Season writer heart Mrs her we but. Design yeah number condition city since.', 350.88, 279.35, 7, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (114, 'Mixer 2', 'Oil individual industry country ahead difference. People your outside rule watch foot economic notice.
Weight age over smile. Need tell sure claim hard themselves. Line require current car.', 524.35, 254.82, 9, 8);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (115, 'Fahrenheit 451 72', 'Left while according allow quality. Yet television audience indicate employee respond building.', 762.02, 541.62, 14, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (116, 'Matilda 3', 'Decide best politics available tonight man each. Garden ready former late election.
Along cause miss ago they nor research fill. Nothing fight require pull.
Chair factor his PM. Surface on chance.', 107.55, 53.74, 16, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (117, 'Sneakers 85', 'Popular onto may model her unit. That lot low here.
Different deal change part rock build. Ground least tree trade style.', 588.24, 360.57, 8, 17);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (118, 'Rug 96', 'American participant necessary before. Safe true town car few. Dinner one ok less Mr.
So authority long kind live between.', 557.57, 311.3, 12, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (119, 'Air Fryer 33', 'Born series consider according throw meeting. Clear assume it fight understand kitchen point. State cover board discussion film figure short. Bill feel participant number choice choose short.', 242.84, 175.96, 9, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (120, 'Audio Interface 69', 'Stop firm final none several accept. Area impact position cause lead ever. Decade respond far health focus.', 951.65, 676.22, 4, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (121, 'Trench Coat 62', 'Heart big policy everybody hard type book care. Foot simple including charge. Operation off no just. Of several end most fact against.', 288.07, 191.66, 7, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (122, 'Golf Club Set 37', 'Budget improve how main.
Art writer health not yet where their.
Man offer plant same north wind sister. Citizen message surface off life practice course. Short issue everybody later.', 980.81, 759.82, 17, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (123, 'Sneakers 23', 'Character talk once should mother president. Show off great they test. Country challenge final beyond.', 313.42, 225.23, 8, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (124, 'Coffee Maker 7', 'Any just cup side opportunity by. Medical official might clear.
Wait scientist group yet. Course world son growth effort born.', 560.5, 400.11, 9, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (125, 'The Very Hungry Caterpillar 2', 'Role today animal suggest concern.
Million cell like although.
Term produce he increase church. Company million character speak. Half understand skill air. Fill personal training enter fly.', 580.87, 355.04, 16, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (126, 'Stainless Pot 7', 'College beyond give development information at why. Work task Mr care owner PM find. Tonight either follow music whatever protect benefit. See system cultural despite candidate walk difficult.', 264.43, 208.31, 11, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (127, 'MSI Stealth 63', 'Officer third service capital instead product often. Security son place. Woman add play structure down.', 88.89, 60.73, 3, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (128, 'Cotton T-Shirt 73', 'Shake enjoy site interview agent myself. Dinner leader book nearly.
Their film job worker. Whom will consumer star.', 949.93, 416.38, 5, 8);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (129, 'Microphone 98', 'Walk participant teach everything where we fast. Will throw life carry visit a edge.
Decade safe order at sense. Century state share southern. Hospital city industry option eat.', 425.51, 284.35, 4, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (130, 'Trainers 67', 'Sea lawyer audience without treat game evening. High through both.
One then reality some serve different. Become rule where ten. Thank professor student white instead.', 390.28, 315.67, 8, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (131, 'Jump Rope 40', 'Opportunity program billion sit remain. Parent not parent that property among blue. Offer brother shake guess.', 575.52, 245.81, 19, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (132, 'Earbuds 27', 'Wind eat land answer leader yard. Shoulder civil next tell possible. Send sit common matter become goal.', 631.5, 327.81, 4, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (133, 'Cargo Shorts 23', 'Fast nice concern peace away behavior Republican. System certainly future government card history. Party wife food different step.', 559.15, 263.05, 6, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (134, 'The Power of Habit 61', 'News your court control million hundred. Thousand without section religious word sound enjoy. Hair understand doctor music baby really.', 302.59, 152.56, 15, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (135, 'Nightstand 59', 'Well commercial nice next. Time live relationship as. Assume rest now water road require.', 86.03, 43.45, 10, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (136, 'Dumbbell Set 55', 'As including claim create woman similar writer structure. Power manager build.
Watch off we hold. High listen suggest consumer find concern.', 128.93, 64.62, 19, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (137, 'Juicer 19', 'Son nothing hear. Western country per consider.
Best raise choice hear computer key. Medical sport knowledge performance.
Southern find fact give. Operation cold between cover. Young turn visit up.', 86.26, 40.94, 9, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (138, 'Rugby Ball 37', 'Executive career shake fall phone. Itself bank agency bit night participant. Marriage skill expert range area.
Water film onto too myself.', 448.12, 273.76, 20, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (139, 'Sapiens 65', 'Authority data deal policy administration two. Too break fact toward process.
Would step head study. Choose out perform. Think institution now tell phone.', 547.33, 326.75, 13, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (140, 'Sony Xperia 95', 'Production development point boy. At Mr cold science western resource reason. Movie expect now board budget.
Never marriage camera yet. Long born also hold base really attack.', 333.15, 170.79, 2, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (141, 'High Heels 74', 'Price keep the attorney early more. Claim natural fish born assume million admit.
Have century billion do high none. Shoulder build different pick nor available.', 593.72, 243.03, 8, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (142, 'Mixer 6', 'Science it feel amount improve they. Would by phone decade image.
Safe know home hair for human rich. Early Republican nothing way role. Guy leg television society hear fill hotel like.', 766.89, 367.21, 9, 17);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (143, 'Thinking Fast Slow 24', 'Shoulder political offer song character first early. Several main particular shake.', 996.98, 594.35, 15, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (144, 'Surface Laptop 45', 'Indeed mother peace citizen. Pick record example summer economic box war.
Sense career herself here. Short only write gun. Once consider thus wife water note.', 417.8, 227.48, 3, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (145, 'Polo Shirt 53', 'Through individual college surface court exactly minute trouble.
Town appear draw fill large item. Evening yet prevent. Four all the unit.
Affect herself toward here along public recent.', 698.56, 370.03, 6, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (146, 'Camping Tent 59', 'South blood avoid health.
Soon single tell act add southern thank. Audience old whole wide piece former professor partner.
Current second ball begin. About social do anyone.', 102.64, 52.71, 18, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (147, 'To Kill a Mockingbird 66', 'Medical bag wind enjoy. Offer country buy seven could support series. Class play or own media.
Interview station save most pressure. Example claim article management total.', 827.72, 331.52, 13, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (148, 'Educated 7', 'Have feel major national seat direction color. Important they food someone war idea. Laugh center seek information agency cause first.', 200.57, 112.88, 15, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (149, 'Matilda 98', 'Government black well relationship. Eye dog wall sound indicate actually final city. Financial peace particularly out morning game health read.', 66.78, 34.74, 16, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (150, 'Bookshelf 90', 'Future soldier recognize top whole sit occur. Remain participant spend eat none.
Memory believe seek perhaps ball make.', 492.95, 203.58, 10, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (151, 'Football Helmet 91', 'Sometimes executive so institution stand action end. Fast agreement popular instead.
Simply year land high church know finish. Lay cup paper expect only. What buy test need hard firm.', 171.83, 111.32, 20, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (152, 'The Great Gatsby 29', 'Senior win full include. Manage nation modern politics.
Nature become debate city. Dinner argue raise agency poor. Long among serve wear west.', 992.37, 804.63, 14, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (153, 'Audio Interface 20', 'Think meeting stock however charge account physical performance. News memory civil cut parent.', 506.39, 365.85, 4, 17);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (154, 'Toaster 62', 'Guess approach personal note this. Describe agency actually stop team. Matter result result leader hospital. Tv lose others some.
Pattern this system people. Water us field.', 980.55, 499.77, 9, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (155, 'Wool Sweater 25', 'Company both right lay though reason event.
Look rule check assume question air market.', 923.11, 580.37, 5, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (156, 'Asus ROG 99', 'Weight major discuss summer another hair our. Star name health top risk must fly. Imagine oil head work should challenge.', 793.36, 465.48, 3, 17);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (157, 'Juicer 1', 'Statement thing wrong name. Billion about various professor clearly dinner report. Major for student health view mission.', 294.3, 157.26, 9, 19);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (158, 'Jump Rope 20', 'Age all building control simply. Attack laugh budget war.
Recently feel hold. Field people try play order. With matter goal eight list something send.', 455.39, 281.41, 19, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (159, 'Headlamp 49', 'Begin early store piece behind here front. Worker alone finally since take describe improve act.
Television sit very know maybe leg recent hold. President any one recently make total fall.', 464.05, 252.81, 18, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (160, 'Sandals 50', 'Significant analysis consumer future. Suffer director know red treatment big cause science. None just happen recognize after modern really play.', 245.82, 184.12, 8, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (161, 'Cast Iron Skillet 61', 'Cost cultural process national newspaper long wife. Old break always dark.
Second hospital head member. Both program one.
They case TV team song.', 709.93, 543.19, 11, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (162, 'Wool Sweater 5', 'Clearly phone including personal visit still image. Amount fly house cover risk health.', 140.22, 117.0, 5, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (163, 'Earbuds 57', 'Field movement force final way memory. Serious style operation nice radio out. Case front reality window mouth pattern as.', 114.11, 92.39, 4, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (164, 'Wool Sweater 84', 'Minute bring reveal factor east our plant front. Heart hot response usually learn game effort. Education whom spend worker.
Country various until lawyer.', 970.43, 420.85, 5, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (165, 'Baking Tray 89', 'Always produce art born with. Exist drive determine page seem. Government door age once several commercial whom.', 407.11, 177.56, 11, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (166, 'Climbing Rope 41', 'Degree beyond bank Republican kind school his. Seek age share day pull job themselves garden. Material past study.', 632.76, 505.8, 18, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (167, 'Camping Tent 80', 'Hand young long collection table. Out special suffer without hair set bed.
Past need economy moment. Laugh fall teach everything trouble.', 83.32, 56.99, 18, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (168, 'High Heels 12', 'Owner baby significant especially situation.
Single network hard condition. Usually early across talk short message again. Thus hour cold light suffer drop participant.', 443.02, 196.83, 8, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (169, 'DAC Amplifier 22', 'Skill officer study if edge view. Me matter source deal. Yes success break tough him federal agency maintain.
Itself point chair tend so.', 698.89, 563.68, 4, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (170, 'Non-Stick Pan 38', 'Far apply let hit. Back family start necessary American wonder.
Good cover two coach. Certainly represent especially agency. Piece he large free party.', 368.72, 218.95, 11, 8);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (171, 'Baseball Bat 73', 'Detail analysis activity card industry create. Interview nothing wrong decision.
Teach enter lot at. Trip close pull box prove speech garden.', 686.88, 330.41, 17, 6);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (172, 'Gigabyte Aero 49', 'Weight feel tell. Station never such despite. Less check better my guy.
Note federal drug performance way production. Unit arm image it increase within. Visit brother dog these man when.', 625.79, 318.13, 3, 19);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (173, 'Cotton T-Shirt 60', 'Likely allow fact.
Program beautiful close finally beyond you. Write pass start court. Today station make environment.', 643.69, 390.6, 5, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (174, 'USB Hub 37', 'Weight fill president spring individual us. Program decision leave reflect already. Onto brother blue large.
Executive four floor dream. Itself but popular wall need onto visit.', 682.76, 321.64, 1, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (175, 'Candle Set 39', 'Seat religious probably when seem test. Account situation west indeed.', 644.71, 380.98, 12, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (176, 'Thinking Fast Slow 26', 'Most threat year partner partner. Show rule always who opportunity face. And forward imagine phone social listen there.', 999.37, 783.51, 15, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (177, 'Loafers 74', 'Maybe weight some. Shoulder professional market oil move. Explain break dog writer night forget nation.
Rate bag positive. Again candidate see election price public indeed.', 369.21, 196.84, 8, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (178, 'L-Shaped Sofa 85', 'Member loss pass size green begin computer. Nation economy adult trial source. Yeah class garden miss.', 405.46, 163.66, 10, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (179, 'Realme GT 96', 'Politics current among laugh about green. Possible indeed study wide television be. Organization no bring career.', 504.77, 407.28, 2, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (180, 'Sandals 46', 'Window hair marriage school. Age wonder foreign Republican thank use. Outside beyond box window should five buy office.', 231.49, 112.4, 8, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (181, 'Denim Jacket 81', 'Blood local light. Image blood city vote time easy. Collection possible notice term piece admit. Rock call scene state radio.', 651.99, 351.44, 5, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (182, 'Realme GT 47', 'Treat explain eat task by inside. Marriage within if course education campaign continue political. Whose eat represent discuss. Seat rule range card design.', 736.63, 324.53, 2, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (183, 'Cast Iron Skillet 54', 'Process quite kitchen cut play deal. Could program water drug major event. Edge item city.
Modern data book expert exist computer shoulder. Size morning only girl popular last read.', 188.82, 86.76, 11, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (184, 'Candle Set 65', 'Ready even probably son second. As whatever blue. Edge each whatever use task.', 914.86, 707.84, 12, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (185, 'Where the Wild Things Are 96', 'Here person three foot. Ground serve mouth manage issue none. Billion time discuss term.
Include you authority race wish kid career. Despite best either truth important.', 872.46, 664.73, 16, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (186, 'HP Spectre 97', 'Somebody thought beyond mean director. Everyone interview give ground laugh receive agree. Wonder occur project court.
Scene run cultural decide car. Article last peace all rise right happen.', 967.03, 761.11, 3, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (187, 'To Kill a Mockingbird 72', 'Record coach require research this. Wear usually together true worker though church. Mouth note well interesting particularly some evidence employee.', 375.91, 284.12, 13, 1);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (188, 'Mixer 16', 'Look training oil scene career military much. Sometimes drive anything teach myself.
Much base modern behavior end. Carry condition into sure day sort determine.', 463.5, 325.74, 9, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (189, 'Mixer 49', 'Base close score.
Bar couple well better. Positive arm piece why ago change government. Public some mean face factor city. Spend outside office live make travel baby.', 825.25, 679.29, 9, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (190, 'Loafers 4', 'Every change help but include something memory. Hard any financial color officer role. Research person apply debate improve task next.', 625.62, 515.78, 8, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (191, 'Football Helmet 83', 'Create responsibility could positive hundred drug pull. Recent people far color.', 78.2, 60.27, 20, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (192, 'Nightstand 53', 'Cost small return. Future raise family where treatment age.
Help in evidence fact office spring measure. Sign room happy.', 130.8, 54.99, 10, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (193, 'Bookshelf 15', 'Rock southern south bed represent lawyer. Return skin name paper cup order piece.
Describe if follow difficult think talk rich. Truth partner measure serve.', 111.63, 89.22, 10, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (194, '1984 48', 'Study model actually read. Line reflect enough exist without build. True think quite hot particular generation.
Find audience but moment. Expert much difficult however local study only.', 675.75, 496.28, 13, 18);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (195, 'Catch-22 96', 'Stop piece sing. Down very investment whom season mind. Bring can sister adult.
Themselves area those guess huge.', 730.96, 583.62, 14, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (196, 'Earbuds 63', 'Worker story face white break. To above month language create. Down television tree say more. Animal do hear rich apply project.', 621.79, 511.47, 4, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (197, 'Nothing Phone 2 28', 'Short of heart sister fast need. Service second put seven take bed mission certain. Often PM notice chair north family. Thought notice society task well three board.', 452.28, 374.37, 2, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (198, 'Audio Interface 48', 'Lead individual through politics. See finally wall right. Parent for production traditional practice together minute.', 551.74, 463.48, 4, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (199, 'Sony Xperia 36', 'Produce behavior nearly of general piece. Address loss international public rate.
Southern finish front under build. Since human chance onto significant.', 202.76, 92.25, 2, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (200, 'Lenovo ThinkPad 83', 'Friend wide take answer at month partner evidence. Picture available scene approach imagine.
Miss the we politics phone anyone happy point. Admit manager kind example class.', 645.25, 540.07, 3, 2);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (201, 'Stainless Pot 17', 'View push enjoy wife cup law.
West fire resource commercial. Trouble husband level until less daughter.
Bad clear here despite. Draw message prove car many of.', 790.38, 389.14, 11, 25);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (202, 'Sleeping Bag 76', 'Every yet door daughter economic big. Move until toward scientist matter message trip.
Street police there. Movie consumer pick end us information occur future.', 228.49, 180.82, 18, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (203, 'Raincoat 1', 'Too million space team administration. Heavy century probably. Congress pick foreign city.', 288.83, 243.43, 5, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (204, 'Hiking Backpack 23', 'Involve participant eye national administration. Camera truth surface sometimes.', 124.16, 98.07, 18, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (205, 'Mechanical Keyboard 31', 'Language local much will cost value. Ever sister white as physical wind manager. Manage my tax off job market suddenly.', 595.42, 242.4, 1, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (206, 'Google Pixel 8 95', 'Herself people rate notice air by. Tonight compare second system environmental. Various hotel order cultural.', 430.22, 194.09, 2, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (207, 'Matilda 100', 'Trial gas cold offer. Watch develop reason gas part rather. Difference yard mean nice.', 372.24, 248.34, 16, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (208, 'Soccer Ball 79', 'Trial out close current. Old especially also stuff decision film.
Law force foreign blue rock. People Democrat information road week best. Language fish administration per well change.', 58.66, 44.14, 17, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (209, 'Tennis Racket 59', 'Guess dog method newspaper short.
Three very newspaper tree. Indicate western tell on indeed senior. Kind fear cold manage full front scientist.', 649.04, 268.71, 17, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (210, '1984 88', 'Agent usually according always choose fill. Only there authority door poor. Son than attorney accept.', 122.22, 88.07, 13, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (211, 'Dell XPS 15 42', 'Section can suffer world. Try explain wear attorney. South common myself staff say.
Call paper these population. Figure begin help account bed each energy civil.', 614.55, 263.98, 3, 9);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (212, 'Rugby Ball 71', 'Bed staff talk score him price drop bill. Near consider keep.
Compare lead Democrat kitchen response describe north. Whom what unit for common office note pass.', 716.75, 409.56, 20, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (213, 'Tennis Racket 59', 'Despite space face walk number end effect. Particularly rise Congress land station team keep. Number key class former.', 513.45, 304.78, 17, 23);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (214, 'Earbuds 84', 'Tell just raise really reveal these project. Continue PM hour article study seek. Dark everything few.
Spring talk off body. Get the west the. Together test age chance officer single role.', 656.49, 489.76, 4, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (215, 'Leggings 58', 'Level produce apply paper second become. Him bit tree among. Return land rich product understand service usually cup.', 889.87, 521.66, 7, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (216, '1984 94', 'Teacher office force care others heart. Style option red.
Return style at score pretty south. Resource notice generation single on. Simply director law.', 109.55, 64.86, 13, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (217, 'Air Fryer 20', 'Cell loss approach. Gun class discuss manager.
Out article responsibility who. International opportunity include candidate team most.', 691.82, 424.38, 9, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (218, 'Dell XPS 15 56', 'Trial policy happy throw final assume kind. Head interesting common early look blood. Left able analysis arrive budget.', 111.01, 81.31, 3, 5);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (219, 'Camping Tent 76', 'Challenge air rest wind. Less crime amount laugh. Approach Republican forward why spend.
Wide west man current hundred box. Agent north consider mother month.', 957.31, 624.89, 18, 22);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (220, 'DAC Amplifier 46', 'Affect arm entire increase beyond whole phone. Sense somebody anything.', 875.62, 721.08, 4, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (221, 'Xiaomi 14 77', 'Possible cup opportunity rate sport. Owner seek bill traditional western chance. Expert any look entire do company focus.
Say whom prove organization old. Yet land address represent.', 323.44, 144.45, 2, 17);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (222, 'Blouse 85', 'Area citizen program agree sort physical. Support top nation wind.
Hard reduce past message mean. Large chair born wish while room Mr personal.', 490.46, 383.18, 7, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (223, 'Hiking Backpack 15', 'Number key medical join activity. Article agent music industry. List behavior successful success herself be.', 766.39, 504.55, 18, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (224, 'Headlamp 79', 'Difference reveal government single least something source. Consider policy those unit reduce executive. Heavy national result very investment enter memory charge.', 680.17, 442.47, 18, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (225, 'Coffee Maker 24', 'Hundred recent direction American job world house. Wrong send knowledge office.
Perhaps as feel. Your both to yes eat. Policy clear star daughter imagine discussion little imagine.', 284.89, 211.7, 9, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (226, 'Wall Art 24', 'Growth what seek many.
Pattern investment practice their. Event skin indicate suddenly like.
Significant camera else Mrs. Piece national what role term left necessary. Even kitchen including summer.', 871.93, 570.98, 12, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (227, 'HP Spectre 95', 'Find medical note read term force. End finish process book party reveal quickly around. Yes east up threat and box listen.', 639.03, 264.43, 3, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (228, 'Soccer Ball 49', 'Southern federal will economic another. Your radio ever total technology party. Marriage anyone smile energy add so.
Interest hair series future throughout number. Should who court media part.', 429.11, 237.47, 17, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (229, 'Nightstand 42', 'Talk brother charge Congress. Into thing really listen husband shake party. Agree bad exactly work begin treat.', 780.4, 511.49, 10, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (230, 'Google Pixel 8 21', 'Land yes impact enjoy clearly.
Challenge book clearly data. Director service long direction generation. Role term mother leave go standard collection work.', 758.35, 320.32, 2, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (231, 'Toaster 85', 'Born war child require. Experience Mr she room man vote safe.
Just similar shake drug fall political score. College court strategy much rate standard today.', 433.22, 291.64, 9, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (232, 'Blender 97', 'Thing activity tax tell skin. Method resource how listen. Method attack interesting writer everything.
Energy into stay decision movement gun. Little people late six.', 520.14, 288.85, 9, 4);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (233, 'Nightstand 87', 'Sound nothing international only method choice. Article year fire official car look ever last. Effect discussion special technology.', 599.63, 382.04, 10, 10);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (234, 'OnePlus 12 51', 'And bring continue compare. Administration reality history.
Boy travel meet place public newspaper. Resource business natural stand country himself behavior. True dog need up.', 984.68, 418.15, 2, 7);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (235, 'Dining Table 99', 'Cup significant admit.
About stage everything forget. Here street former total animal item to hope. Begin actually positive trouble federal.
Region through wall would. Space must beyond.', 151.03, 77.78, 10, 11);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (236, 'Studio Monitors 64', 'Authority air sort investment guy such notice to. Really door against. Car thing shake grow.', 751.05, 359.8, 4, 13);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (237, 'Sleeping Bag 65', 'Part or vote job. Class owner local mention.
Apply religious yet this return hand trouble. Statement get family main.
Itself media able official call thank.', 565.77, 396.39, 18, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (238, 'MSI Stealth 95', 'Me try particularly thought. Above become minute war stage. Claim energy laugh bed.
Hope value under some. According assume skill wall political send. Before off window particular.', 57.62, 23.53, 3, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (239, 'Baking Tray 55', 'Above low town. Theory off fine represent. Dinner position something miss including.', 580.22, 417.34, 11, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (240, 'L-Shaped Sofa 52', 'Child simple professional. Develop consumer life father wife situation. Just model thing drop the character.', 36.51, 19.94, 10, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (241, 'Thinking Fast Slow 12', 'Image case answer free knowledge. Until relate hour large friend bag. City north role act alone view. Blue management record room program outside.', 445.71, 199.52, 15, 14);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (242, 'Jump Rope 68', 'Rather concern plant. Response he doctor stage usually recognize. Radio your throw project.
Too size tonight ground while action. Service record anything floor front television.', 93.38, 73.93, 19, 24);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (243, 'Stainless Pot 43', 'Region suddenly less nearly us remain. Purpose popular tree project stop answer work explain.', 782.64, 339.96, 11, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (244, 'Microphone 66', 'Grow service during health note chair guess. Almost imagine main wait.
Huge investment trial.
Available hit keep enjoy. You may reason by threat. Production now eye ok white.', 206.79, 154.95, 4, 12);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (245, 'Cotton T-Shirt 14', 'Physical product of single. Smile film task attorney say. Number poor throughout. Green accept share.', 160.09, 78.25, 5, 20);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (246, 'Denim Jacket 23', 'Commercial say side find. Another well drive provide think something.
Have minute back left leg agency other. Traditional boy song.', 952.06, 649.85, 5, 15);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (247, 'Kettlebell 58', 'Mission travel reveal rather. Behind blood born job movie forward nearly. Thing notice less win cold real high might.
True long she record teach attack.', 686.23, 546.87, 19, 21);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (248, 'Hockey Stick 81', 'Production choice edge everyone. Would pressure room under team security at.
Own cultural act call physical actually already. Without everybody research chance system. Response marriage sure camera.', 327.07, 195.55, 20, 16);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (249, 'Thinking Fast Slow 36', 'Discuss stock lead green total benefit Mr car. Raise prepare wrong bed. Like her part team.
See most budget size enough success score start. Per hot character ball.', 597.95, 333.88, 15, 3);
INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES (250, 'Bookshelf 58', 'Doctor hour check now sound gun.
Ok single situation feel already. Hot cultural fill show response nothing.
Few page cold. Can college care think brother. Why eight skill program try.', 53.0, 29.99, 10, 10);

-- Inventory (Replicated)
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (1, 1, 178, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (1, 2, 493, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (1, 3, 115, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (1, 4, 493, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (1, 5, 232, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (1, 6, 294, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (2, 1, 133, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (2, 2, 208, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (2, 3, 54, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (2, 4, 37, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (2, 5, 150, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (2, 6, 484, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (3, 1, 411, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (3, 2, 489, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (3, 3, 448, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (3, 4, 416, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (3, 5, 128, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (3, 6, 494, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (4, 1, 288, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (4, 2, 394, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (4, 3, 387, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (4, 4, 492, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (4, 5, 348, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (4, 6, 459, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (5, 1, 441, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (5, 2, 246, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (5, 3, 132, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (5, 4, 195, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (5, 5, 403, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (5, 6, 346, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (6, 1, 409, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (6, 2, 211, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (6, 3, 264, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (6, 4, 4, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (6, 5, 127, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (6, 6, 47, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (7, 1, 344, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (7, 2, 38, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (7, 3, 476, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (7, 4, 243, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (7, 5, 181, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (7, 6, 457, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (8, 1, 137, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (8, 2, 484, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (8, 3, 255, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (8, 4, 120, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (8, 5, 446, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (8, 6, 105, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (9, 1, 103, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (9, 2, 428, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (9, 3, 182, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (9, 4, 398, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (9, 5, 61, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (9, 6, 346, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (10, 1, 314, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (10, 2, 391, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (10, 3, 490, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (10, 4, 434, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (10, 5, 190, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (10, 6, 161, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (11, 1, 459, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (11, 2, 444, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (11, 3, 251, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (11, 4, 391, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (11, 5, 143, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (11, 6, 113, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (12, 1, 65, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (12, 2, 269, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (12, 3, 244, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (12, 4, 16, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (12, 5, 177, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (12, 6, 440, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (13, 1, 234, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (13, 2, 357, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (13, 3, 235, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (13, 4, 352, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (13, 5, 6, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (13, 6, 194, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (14, 1, 51, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (14, 2, 185, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (14, 3, 441, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (14, 4, 95, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (14, 5, 134, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (14, 6, 137, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (15, 1, 490, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (15, 2, 175, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (15, 3, 94, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (15, 4, 217, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (15, 5, 214, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (15, 6, 186, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (16, 1, 143, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (16, 2, 92, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (16, 3, 67, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (16, 4, 351, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (16, 5, 416, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (16, 6, 369, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (17, 1, 411, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (17, 2, 284, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (17, 3, 438, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (17, 4, 100, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (17, 5, 409, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (17, 6, 242, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (18, 1, 90, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (18, 2, 255, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (18, 3, 457, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (18, 4, 264, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (18, 5, 368, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (18, 6, 402, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (19, 1, 153, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (19, 2, 287, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (19, 3, 24, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (19, 4, 50, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (19, 5, 30, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (19, 6, 416, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (20, 1, 243, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (20, 2, 49, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (20, 3, 381, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (20, 4, 133, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (20, 5, 184, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (20, 6, 285, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (21, 1, 176, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (21, 2, 210, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (21, 3, 179, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (21, 4, 101, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (21, 5, 294, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (21, 6, 332, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (22, 1, 89, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (22, 2, 181, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (22, 3, 344, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (22, 4, 249, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (22, 5, 455, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (22, 6, 195, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (23, 1, 146, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (23, 2, 323, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (23, 3, 444, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (23, 4, 327, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (23, 5, 215, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (23, 6, 313, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (24, 1, 207, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (24, 2, 40, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (24, 3, 175, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (24, 4, 160, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (24, 5, 334, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (24, 6, 363, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (25, 1, 309, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (25, 2, 202, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (25, 3, 454, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (25, 4, 399, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (25, 5, 382, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (25, 6, 266, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (26, 1, 211, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (26, 2, 94, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (26, 3, 64, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (26, 4, 338, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (26, 5, 481, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (26, 6, 107, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (27, 1, 203, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (27, 2, 48, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (27, 3, 479, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (27, 4, 280, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (27, 5, 13, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (27, 6, 268, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (28, 1, 53, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (28, 2, 316, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (28, 3, 43, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (28, 4, 476, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (28, 5, 158, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (28, 6, 126, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (29, 1, 226, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (29, 2, 64, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (29, 3, 269, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (29, 4, 14, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (29, 5, 339, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (29, 6, 440, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (30, 1, 442, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (30, 2, 239, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (30, 3, 478, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (30, 4, 280, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (30, 5, 69, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (30, 6, 90, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (31, 1, 305, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (31, 2, 323, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (31, 3, 449, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (31, 4, 222, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (31, 5, 327, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (31, 6, 273, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (32, 1, 465, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (32, 2, 246, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (32, 3, 116, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (32, 4, 226, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (32, 5, 187, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (32, 6, 133, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (33, 1, 155, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (33, 2, 0, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (33, 3, 417, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (33, 4, 176, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (33, 5, 240, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (33, 6, 4, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (34, 1, 484, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (34, 2, 153, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (34, 3, 392, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (34, 4, 408, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (34, 5, 305, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (34, 6, 407, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (35, 1, 280, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (35, 2, 96, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (35, 3, 451, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (35, 4, 223, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (35, 5, 127, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (35, 6, 366, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (36, 1, 199, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (36, 2, 112, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (36, 3, 40, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (36, 4, 320, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (36, 5, 264, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (36, 6, 413, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (37, 1, 145, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (37, 2, 380, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (37, 3, 414, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (37, 4, 211, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (37, 5, 436, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (37, 6, 93, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (38, 1, 148, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (38, 2, 326, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (38, 3, 316, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (38, 4, 139, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (38, 5, 251, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (38, 6, 164, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (39, 1, 77, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (39, 2, 496, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (39, 3, 11, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (39, 4, 497, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (39, 5, 144, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (39, 6, 64, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (40, 1, 372, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (40, 2, 119, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (40, 3, 77, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (40, 4, 252, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (40, 5, 175, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (40, 6, 159, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (41, 1, 190, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (41, 2, 356, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (41, 3, 169, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (41, 4, 431, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (41, 5, 28, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (41, 6, 397, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (42, 1, 36, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (42, 2, 240, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (42, 3, 98, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (42, 4, 418, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (42, 5, 424, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (42, 6, 62, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (43, 1, 197, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (43, 2, 126, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (43, 3, 101, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (43, 4, 376, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (43, 5, 266, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (43, 6, 242, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (44, 1, 348, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (44, 2, 479, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (44, 3, 81, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (44, 4, 372, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (44, 5, 381, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (44, 6, 266, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (45, 1, 129, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (45, 2, 326, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (45, 3, 101, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (45, 4, 454, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (45, 5, 442, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (45, 6, 498, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (46, 1, 120, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (46, 2, 222, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (46, 3, 7, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (46, 4, 406, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (46, 5, 299, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (46, 6, 202, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (47, 1, 4, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (47, 2, 297, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (47, 3, 352, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (47, 4, 79, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (47, 5, 394, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (47, 6, 127, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (48, 1, 255, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (48, 2, 351, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (48, 3, 173, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (48, 4, 30, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (48, 5, 182, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (48, 6, 78, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (49, 1, 405, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (49, 2, 64, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (49, 3, 119, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (49, 4, 285, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (49, 5, 387, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (49, 6, 412, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (50, 1, 375, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (50, 2, 10, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (50, 3, 183, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (50, 4, 128, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (50, 5, 248, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (50, 6, 286, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (51, 1, 277, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (51, 2, 97, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (51, 3, 95, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (51, 4, 178, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (51, 5, 374, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (51, 6, 140, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (52, 1, 468, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (52, 2, 82, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (52, 3, 271, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (52, 4, 230, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (52, 5, 419, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (52, 6, 277, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (53, 1, 232, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (53, 2, 397, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (53, 3, 259, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (53, 4, 375, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (53, 5, 452, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (53, 6, 317, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (54, 1, 397, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (54, 2, 122, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (54, 3, 369, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (54, 4, 337, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (54, 5, 419, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (54, 6, 97, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (55, 1, 349, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (55, 2, 392, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (55, 3, 78, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (55, 4, 144, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (55, 5, 209, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (55, 6, 164, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (56, 1, 49, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (56, 2, 337, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (56, 3, 22, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (56, 4, 91, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (56, 5, 103, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (56, 6, 248, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (57, 1, 50, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (57, 2, 292, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (57, 3, 428, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (57, 4, 336, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (57, 5, 269, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (57, 6, 359, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (58, 1, 131, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (58, 2, 187, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (58, 3, 310, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (58, 4, 6, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (58, 5, 335, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (58, 6, 475, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (59, 1, 239, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (59, 2, 31, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (59, 3, 285, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (59, 4, 420, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (59, 5, 406, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (59, 6, 421, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (60, 1, 136, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (60, 2, 20, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (60, 3, 427, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (60, 4, 39, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (60, 5, 491, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (60, 6, 49, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (61, 1, 371, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (61, 2, 272, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (61, 3, 97, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (61, 4, 269, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (61, 5, 291, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (61, 6, 485, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (62, 1, 285, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (62, 2, 212, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (62, 3, 392, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (62, 4, 295, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (62, 5, 345, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (62, 6, 359, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (63, 1, 452, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (63, 2, 85, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (63, 3, 281, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (63, 4, 258, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (63, 5, 336, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (63, 6, 273, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (64, 1, 226, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (64, 2, 462, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (64, 3, 281, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (64, 4, 432, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (64, 5, 211, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (64, 6, 220, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (65, 1, 311, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (65, 2, 288, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (65, 3, 109, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (65, 4, 392, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (65, 5, 474, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (65, 6, 184, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (66, 1, 229, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (66, 2, 0, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (66, 3, 145, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (66, 4, 8, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (66, 5, 69, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (66, 6, 3, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (67, 1, 113, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (67, 2, 438, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (67, 3, 11, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (67, 4, 470, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (67, 5, 261, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (67, 6, 292, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (68, 1, 79, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (68, 2, 19, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (68, 3, 182, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (68, 4, 70, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (68, 5, 187, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (68, 6, 127, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (69, 1, 131, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (69, 2, 47, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (69, 3, 204, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (69, 4, 469, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (69, 5, 375, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (69, 6, 370, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (70, 1, 405, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (70, 2, 88, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (70, 3, 422, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (70, 4, 419, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (70, 5, 304, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (70, 6, 153, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (71, 1, 374, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (71, 2, 195, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (71, 3, 399, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (71, 4, 471, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (71, 5, 178, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (71, 6, 213, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (72, 1, 445, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (72, 2, 382, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (72, 3, 434, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (72, 4, 475, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (72, 5, 324, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (72, 6, 195, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (73, 1, 156, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (73, 2, 21, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (73, 3, 276, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (73, 4, 76, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (73, 5, 257, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (73, 6, 78, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (74, 1, 344, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (74, 2, 497, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (74, 3, 385, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (74, 4, 294, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (74, 5, 46, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (74, 6, 221, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (75, 1, 402, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (75, 2, 75, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (75, 3, 172, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (75, 4, 243, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (75, 5, 381, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (75, 6, 280, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (76, 1, 134, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (76, 2, 204, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (76, 3, 222, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (76, 4, 390, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (76, 5, 246, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (76, 6, 101, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (77, 1, 202, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (77, 2, 292, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (77, 3, 287, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (77, 4, 376, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (77, 5, 126, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (77, 6, 36, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (78, 1, 397, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (78, 2, 165, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (78, 3, 45, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (78, 4, 343, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (78, 5, 216, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (78, 6, 178, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (79, 1, 164, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (79, 2, 304, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (79, 3, 12, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (79, 4, 86, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (79, 5, 315, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (79, 6, 319, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (80, 1, 225, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (80, 2, 473, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (80, 3, 102, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (80, 4, 79, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (80, 5, 57, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (80, 6, 124, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (81, 1, 474, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (81, 2, 444, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (81, 3, 7, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (81, 4, 355, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (81, 5, 156, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (81, 6, 241, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (82, 1, 169, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (82, 2, 378, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (82, 3, 108, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (82, 4, 279, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (82, 5, 384, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (82, 6, 280, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (83, 1, 318, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (83, 2, 355, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (83, 3, 192, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (83, 4, 463, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (83, 5, 22, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (83, 6, 87, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (84, 1, 145, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (84, 2, 404, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (84, 3, 138, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (84, 4, 238, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (84, 5, 483, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (84, 6, 34, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (85, 1, 338, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (85, 2, 339, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (85, 3, 442, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (85, 4, 9, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (85, 5, 444, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (85, 6, 197, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (86, 1, 194, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (86, 2, 500, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (86, 3, 462, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (86, 4, 248, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (86, 5, 272, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (86, 6, 95, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (87, 1, 256, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (87, 2, 287, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (87, 3, 20, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (87, 4, 472, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (87, 5, 156, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (87, 6, 250, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (88, 1, 381, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (88, 2, 9, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (88, 3, 350, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (88, 4, 181, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (88, 5, 154, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (88, 6, 500, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (89, 1, 141, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (89, 2, 320, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (89, 3, 449, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (89, 4, 455, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (89, 5, 483, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (89, 6, 485, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (90, 1, 115, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (90, 2, 174, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (90, 3, 336, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (90, 4, 44, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (90, 5, 266, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (90, 6, 446, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (91, 1, 351, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (91, 2, 213, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (91, 3, 293, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (91, 4, 218, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (91, 5, 465, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (91, 6, 168, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (92, 1, 277, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (92, 2, 105, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (92, 3, 70, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (92, 4, 277, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (92, 5, 441, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (92, 6, 158, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (93, 1, 465, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (93, 2, 220, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (93, 3, 335, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (93, 4, 469, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (93, 5, 162, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (93, 6, 285, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (94, 1, 485, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (94, 2, 94, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (94, 3, 429, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (94, 4, 372, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (94, 5, 391, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (94, 6, 450, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (95, 1, 492, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (95, 2, 155, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (95, 3, 381, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (95, 4, 477, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (95, 5, 77, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (95, 6, 54, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (96, 1, 94, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (96, 2, 390, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (96, 3, 315, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (96, 4, 310, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (96, 5, 313, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (96, 6, 305, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (97, 1, 118, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (97, 2, 183, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (97, 3, 352, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (97, 4, 68, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (97, 5, 433, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (97, 6, 240, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (98, 1, 191, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (98, 2, 436, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (98, 3, 251, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (98, 4, 70, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (98, 5, 98, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (98, 6, 16, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (99, 1, 391, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (99, 2, 473, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (99, 3, 486, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (99, 4, 113, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (99, 5, 387, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (99, 6, 33, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (100, 1, 474, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (100, 2, 443, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (100, 3, 250, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (100, 4, 443, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (100, 5, 454, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (100, 6, 218, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (101, 1, 397, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (101, 2, 311, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (101, 3, 368, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (101, 4, 201, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (101, 5, 480, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (101, 6, 304, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (102, 1, 268, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (102, 2, 448, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (102, 3, 266, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (102, 4, 231, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (102, 5, 423, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (102, 6, 449, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (103, 1, 265, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (103, 2, 202, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (103, 3, 285, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (103, 4, 264, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (103, 5, 492, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (103, 6, 97, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (104, 1, 225, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (104, 2, 452, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (104, 3, 396, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (104, 4, 236, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (104, 5, 216, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (104, 6, 313, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (105, 1, 353, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (105, 2, 462, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (105, 3, 237, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (105, 4, 231, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (105, 5, 369, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (105, 6, 57, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (106, 1, 398, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (106, 2, 480, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (106, 3, 69, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (106, 4, 211, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (106, 5, 230, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (106, 6, 91, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (107, 1, 302, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (107, 2, 451, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (107, 3, 46, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (107, 4, 165, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (107, 5, 464, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (107, 6, 367, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (108, 1, 46, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (108, 2, 361, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (108, 3, 324, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (108, 4, 43, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (108, 5, 362, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (108, 6, 372, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (109, 1, 313, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (109, 2, 193, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (109, 3, 194, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (109, 4, 393, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (109, 5, 467, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (109, 6, 289, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (110, 1, 83, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (110, 2, 91, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (110, 3, 214, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (110, 4, 158, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (110, 5, 147, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (110, 6, 92, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (111, 1, 460, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (111, 2, 491, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (111, 3, 1, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (111, 4, 391, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (111, 5, 6, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (111, 6, 254, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (112, 1, 278, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (112, 2, 311, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (112, 3, 121, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (112, 4, 301, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (112, 5, 232, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (112, 6, 226, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (113, 1, 307, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (113, 2, 3, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (113, 3, 451, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (113, 4, 142, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (113, 5, 321, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (113, 6, 419, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (114, 1, 25, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (114, 2, 75, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (114, 3, 334, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (114, 4, 18, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (114, 5, 437, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (114, 6, 341, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (115, 1, 429, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (115, 2, 152, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (115, 3, 471, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (115, 4, 25, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (115, 5, 213, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (115, 6, 82, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (116, 1, 312, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (116, 2, 293, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (116, 3, 90, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (116, 4, 383, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (116, 5, 184, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (116, 6, 47, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (117, 1, 165, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (117, 2, 459, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (117, 3, 419, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (117, 4, 388, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (117, 5, 431, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (117, 6, 33, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (118, 1, 241, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (118, 2, 62, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (118, 3, 168, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (118, 4, 211, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (118, 5, 107, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (118, 6, 313, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (119, 1, 55, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (119, 2, 373, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (119, 3, 270, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (119, 4, 247, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (119, 5, 478, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (119, 6, 218, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (120, 1, 434, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (120, 2, 132, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (120, 3, 294, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (120, 4, 181, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (120, 5, 314, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (120, 6, 254, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (121, 1, 373, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (121, 2, 254, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (121, 3, 413, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (121, 4, 452, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (121, 5, 119, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (121, 6, 99, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (122, 1, 60, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (122, 2, 238, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (122, 3, 407, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (122, 4, 377, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (122, 5, 409, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (122, 6, 212, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (123, 1, 23, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (123, 2, 179, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (123, 3, 412, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (123, 4, 108, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (123, 5, 327, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (123, 6, 353, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (124, 1, 130, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (124, 2, 157, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (124, 3, 259, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (124, 4, 165, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (124, 5, 58, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (124, 6, 174, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (125, 1, 370, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (125, 2, 315, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (125, 3, 426, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (125, 4, 99, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (125, 5, 426, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (125, 6, 472, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (126, 1, 469, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (126, 2, 408, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (126, 3, 330, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (126, 4, 246, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (126, 5, 321, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (126, 6, 456, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (127, 1, 458, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (127, 2, 236, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (127, 3, 475, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (127, 4, 427, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (127, 5, 153, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (127, 6, 371, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (128, 1, 284, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (128, 2, 9, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (128, 3, 295, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (128, 4, 409, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (128, 5, 33, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (128, 6, 143, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (129, 1, 173, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (129, 2, 320, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (129, 3, 431, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (129, 4, 292, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (129, 5, 199, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (129, 6, 304, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (130, 1, 442, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (130, 2, 361, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (130, 3, 363, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (130, 4, 139, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (130, 5, 44, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (130, 6, 449, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (131, 1, 190, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (131, 2, 424, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (131, 3, 110, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (131, 4, 154, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (131, 5, 57, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (131, 6, 401, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (132, 1, 398, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (132, 2, 467, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (132, 3, 227, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (132, 4, 12, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (132, 5, 463, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (132, 6, 78, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (133, 1, 174, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (133, 2, 375, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (133, 3, 158, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (133, 4, 73, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (133, 5, 420, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (133, 6, 346, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (134, 1, 105, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (134, 2, 235, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (134, 3, 365, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (134, 4, 59, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (134, 5, 159, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (134, 6, 351, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (135, 1, 446, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (135, 2, 170, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (135, 3, 455, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (135, 4, 52, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (135, 5, 392, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (135, 6, 11, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (136, 1, 388, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (136, 2, 327, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (136, 3, 164, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (136, 4, 98, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (136, 5, 141, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (136, 6, 163, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (137, 1, 343, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (137, 2, 139, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (137, 3, 80, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (137, 4, 58, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (137, 5, 490, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (137, 6, 286, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (138, 1, 52, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (138, 2, 277, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (138, 3, 281, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (138, 4, 138, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (138, 5, 482, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (138, 6, 293, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (139, 1, 87, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (139, 2, 159, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (139, 3, 456, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (139, 4, 276, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (139, 5, 25, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (139, 6, 14, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (140, 1, 462, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (140, 2, 54, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (140, 3, 27, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (140, 4, 218, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (140, 5, 91, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (140, 6, 456, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (141, 1, 322, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (141, 2, 315, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (141, 3, 159, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (141, 4, 418, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (141, 5, 365, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (141, 6, 40, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (142, 1, 290, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (142, 2, 47, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (142, 3, 49, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (142, 4, 158, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (142, 5, 363, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (142, 6, 240, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (143, 1, 485, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (143, 2, 73, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (143, 3, 132, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (143, 4, 200, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (143, 5, 358, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (143, 6, 403, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (144, 1, 232, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (144, 2, 15, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (144, 3, 243, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (144, 4, 179, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (144, 5, 236, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (144, 6, 144, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (145, 1, 309, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (145, 2, 65, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (145, 3, 52, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (145, 4, 418, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (145, 5, 166, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (145, 6, 332, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (146, 1, 405, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (146, 2, 272, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (146, 3, 205, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (146, 4, 211, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (146, 5, 317, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (146, 6, 280, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (147, 1, 498, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (147, 2, 196, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (147, 3, 174, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (147, 4, 416, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (147, 5, 220, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (147, 6, 290, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (148, 1, 278, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (148, 2, 88, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (148, 3, 378, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (148, 4, 428, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (148, 5, 58, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (148, 6, 305, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (149, 1, 166, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (149, 2, 49, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (149, 3, 90, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (149, 4, 489, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (149, 5, 35, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (149, 6, 55, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (150, 1, 394, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (150, 2, 167, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (150, 3, 330, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (150, 4, 46, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (150, 5, 418, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (150, 6, 454, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (151, 1, 462, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (151, 2, 414, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (151, 3, 387, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (151, 4, 338, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (151, 5, 231, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (151, 6, 149, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (152, 1, 315, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (152, 2, 228, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (152, 3, 105, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (152, 4, 153, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (152, 5, 406, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (152, 6, 470, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (153, 1, 367, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (153, 2, 45, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (153, 3, 4, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (153, 4, 261, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (153, 5, 433, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (153, 6, 436, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (154, 1, 31, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (154, 2, 461, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (154, 3, 495, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (154, 4, 0, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (154, 5, 420, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (154, 6, 56, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (155, 1, 443, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (155, 2, 120, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (155, 3, 359, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (155, 4, 201, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (155, 5, 162, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (155, 6, 207, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (156, 1, 222, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (156, 2, 108, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (156, 3, 243, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (156, 4, 96, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (156, 5, 196, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (156, 6, 430, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (157, 1, 78, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (157, 2, 446, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (157, 3, 68, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (157, 4, 36, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (157, 5, 8, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (157, 6, 369, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (158, 1, 336, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (158, 2, 499, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (158, 3, 43, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (158, 4, 328, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (158, 5, 440, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (158, 6, 457, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (159, 1, 476, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (159, 2, 319, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (159, 3, 232, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (159, 4, 217, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (159, 5, 419, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (159, 6, 196, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (160, 1, 115, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (160, 2, 217, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (160, 3, 3, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (160, 4, 255, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (160, 5, 364, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (160, 6, 137, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (161, 1, 474, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (161, 2, 295, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (161, 3, 17, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (161, 4, 290, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (161, 5, 360, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (161, 6, 57, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (162, 1, 246, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (162, 2, 72, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (162, 3, 439, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (162, 4, 238, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (162, 5, 40, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (162, 6, 455, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (163, 1, 45, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (163, 2, 241, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (163, 3, 379, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (163, 4, 350, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (163, 5, 276, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (163, 6, 159, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (164, 1, 27, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (164, 2, 273, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (164, 3, 240, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (164, 4, 262, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (164, 5, 293, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (164, 6, 215, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (165, 1, 491, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (165, 2, 148, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (165, 3, 18, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (165, 4, 383, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (165, 5, 372, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (165, 6, 133, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (166, 1, 322, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (166, 2, 296, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (166, 3, 293, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (166, 4, 336, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (166, 5, 414, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (166, 6, 13, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (167, 1, 248, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (167, 2, 64, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (167, 3, 39, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (167, 4, 129, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (167, 5, 315, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (167, 6, 140, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (168, 1, 7, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (168, 2, 309, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (168, 3, 465, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (168, 4, 378, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (168, 5, 337, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (168, 6, 189, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (169, 1, 133, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (169, 2, 248, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (169, 3, 409, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (169, 4, 441, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (169, 5, 175, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (169, 6, 495, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (170, 1, 304, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (170, 2, 428, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (170, 3, 385, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (170, 4, 394, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (170, 5, 121, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (170, 6, 371, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (171, 1, 85, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (171, 2, 295, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (171, 3, 27, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (171, 4, 135, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (171, 5, 26, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (171, 6, 237, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (172, 1, 243, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (172, 2, 243, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (172, 3, 119, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (172, 4, 349, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (172, 5, 242, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (172, 6, 74, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (173, 1, 445, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (173, 2, 6, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (173, 3, 474, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (173, 4, 195, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (173, 5, 492, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (173, 6, 349, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (174, 1, 49, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (174, 2, 326, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (174, 3, 489, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (174, 4, 312, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (174, 5, 439, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (174, 6, 171, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (175, 1, 136, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (175, 2, 130, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (175, 3, 299, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (175, 4, 236, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (175, 5, 375, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (175, 6, 394, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (176, 1, 266, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (176, 2, 346, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (176, 3, 160, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (176, 4, 5, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (176, 5, 425, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (176, 6, 6, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (177, 1, 50, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (177, 2, 53, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (177, 3, 179, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (177, 4, 371, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (177, 5, 128, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (177, 6, 17, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (178, 1, 317, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (178, 2, 29, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (178, 3, 336, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (178, 4, 486, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (178, 5, 326, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (178, 6, 362, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (179, 1, 44, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (179, 2, 66, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (179, 3, 336, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (179, 4, 289, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (179, 5, 458, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (179, 6, 356, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (180, 1, 129, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (180, 2, 239, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (180, 3, 327, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (180, 4, 472, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (180, 5, 393, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (180, 6, 354, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (181, 1, 131, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (181, 2, 399, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (181, 3, 141, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (181, 4, 195, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (181, 5, 170, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (181, 6, 132, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (182, 1, 91, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (182, 2, 35, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (182, 3, 475, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (182, 4, 312, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (182, 5, 91, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (182, 6, 251, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (183, 1, 73, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (183, 2, 393, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (183, 3, 111, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (183, 4, 329, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (183, 5, 467, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (183, 6, 366, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (184, 1, 52, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (184, 2, 37, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (184, 3, 292, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (184, 4, 397, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (184, 5, 9, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (184, 6, 76, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (185, 1, 327, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (185, 2, 477, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (185, 3, 340, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (185, 4, 136, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (185, 5, 358, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (185, 6, 463, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (186, 1, 294, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (186, 2, 263, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (186, 3, 244, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (186, 4, 206, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (186, 5, 276, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (186, 6, 1, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (187, 1, 488, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (187, 2, 62, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (187, 3, 274, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (187, 4, 170, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (187, 5, 205, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (187, 6, 323, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (188, 1, 46, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (188, 2, 273, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (188, 3, 41, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (188, 4, 389, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (188, 5, 331, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (188, 6, 90, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (189, 1, 20, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (189, 2, 338, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (189, 3, 153, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (189, 4, 458, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (189, 5, 322, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (189, 6, 249, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (190, 1, 453, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (190, 2, 224, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (190, 3, 71, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (190, 4, 98, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (190, 5, 368, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (190, 6, 122, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (191, 1, 199, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (191, 2, 405, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (191, 3, 329, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (191, 4, 255, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (191, 5, 494, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (191, 6, 494, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (192, 1, 18, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (192, 2, 28, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (192, 3, 403, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (192, 4, 207, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (192, 5, 108, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (192, 6, 341, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (193, 1, 234, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (193, 2, 76, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (193, 3, 119, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (193, 4, 18, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (193, 5, 250, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (193, 6, 9, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (194, 1, 464, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (194, 2, 23, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (194, 3, 359, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (194, 4, 66, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (194, 5, 88, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (194, 6, 25, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (195, 1, 420, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (195, 2, 233, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (195, 3, 87, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (195, 4, 32, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (195, 5, 58, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (195, 6, 304, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (196, 1, 112, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (196, 2, 411, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (196, 3, 218, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (196, 4, 415, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (196, 5, 166, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (196, 6, 499, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (197, 1, 279, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (197, 2, 164, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (197, 3, 391, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (197, 4, 303, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (197, 5, 171, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (197, 6, 61, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (198, 1, 72, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (198, 2, 86, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (198, 3, 283, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (198, 4, 224, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (198, 5, 473, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (198, 6, 20, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (199, 1, 51, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (199, 2, 313, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (199, 3, 398, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (199, 4, 8, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (199, 5, 41, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (199, 6, 3, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (200, 1, 474, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (200, 2, 361, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (200, 3, 303, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (200, 4, 213, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (200, 5, 354, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (200, 6, 105, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (201, 1, 327, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (201, 2, 267, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (201, 3, 210, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (201, 4, 480, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (201, 5, 312, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (201, 6, 305, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (202, 1, 367, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (202, 2, 313, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (202, 3, 321, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (202, 4, 178, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (202, 5, 2, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (202, 6, 120, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (203, 1, 60, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (203, 2, 500, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (203, 3, 316, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (203, 4, 441, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (203, 5, 259, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (203, 6, 237, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (204, 1, 337, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (204, 2, 141, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (204, 3, 99, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (204, 4, 407, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (204, 5, 350, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (204, 6, 254, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (205, 1, 81, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (205, 2, 27, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (205, 3, 186, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (205, 4, 107, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (205, 5, 128, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (205, 6, 315, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (206, 1, 22, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (206, 2, 379, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (206, 3, 473, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (206, 4, 90, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (206, 5, 402, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (206, 6, 248, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (207, 1, 59, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (207, 2, 458, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (207, 3, 369, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (207, 4, 303, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (207, 5, 166, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (207, 6, 101, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (208, 1, 117, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (208, 2, 166, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (208, 3, 50, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (208, 4, 377, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (208, 5, 445, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (208, 6, 192, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (209, 1, 37, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (209, 2, 299, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (209, 3, 27, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (209, 4, 74, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (209, 5, 475, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (209, 6, 232, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (210, 1, 198, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (210, 2, 69, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (210, 3, 368, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (210, 4, 323, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (210, 5, 499, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (210, 6, 103, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (211, 1, 65, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (211, 2, 354, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (211, 3, 30, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (211, 4, 69, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (211, 5, 436, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (211, 6, 234, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (212, 1, 87, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (212, 2, 112, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (212, 3, 309, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (212, 4, 404, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (212, 5, 487, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (212, 6, 463, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (213, 1, 295, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (213, 2, 437, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (213, 3, 44, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (213, 4, 438, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (213, 5, 250, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (213, 6, 302, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (214, 1, 428, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (214, 2, 142, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (214, 3, 373, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (214, 4, 376, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (214, 5, 126, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (214, 6, 222, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (215, 1, 113, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (215, 2, 484, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (215, 3, 467, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (215, 4, 459, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (215, 5, 213, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (215, 6, 20, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (216, 1, 375, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (216, 2, 17, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (216, 3, 271, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (216, 4, 245, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (216, 5, 231, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (216, 6, 123, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (217, 1, 285, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (217, 2, 354, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (217, 3, 486, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (217, 4, 67, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (217, 5, 151, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (217, 6, 331, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (218, 1, 8, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (218, 2, 342, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (218, 3, 82, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (218, 4, 439, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (218, 5, 382, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (218, 6, 12, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (219, 1, 237, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (219, 2, 447, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (219, 3, 94, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (219, 4, 320, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (219, 5, 360, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (219, 6, 0, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (220, 1, 36, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (220, 2, 457, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (220, 3, 271, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (220, 4, 151, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (220, 5, 385, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (220, 6, 357, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (221, 1, 277, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (221, 2, 406, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (221, 3, 403, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (221, 4, 317, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (221, 5, 376, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (221, 6, 263, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (222, 1, 454, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (222, 2, 56, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (222, 3, 187, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (222, 4, 316, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (222, 5, 187, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (222, 6, 89, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (223, 1, 286, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (223, 2, 287, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (223, 3, 70, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (223, 4, 122, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (223, 5, 58, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (223, 6, 244, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (224, 1, 446, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (224, 2, 385, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (224, 3, 164, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (224, 4, 459, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (224, 5, 257, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (224, 6, 141, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (225, 1, 32, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (225, 2, 176, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (225, 3, 248, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (225, 4, 269, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (225, 5, 240, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (225, 6, 347, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (226, 1, 460, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (226, 2, 231, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (226, 3, 188, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (226, 4, 96, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (226, 5, 44, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (226, 6, 200, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (227, 1, 147, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (227, 2, 55, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (227, 3, 141, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (227, 4, 356, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (227, 5, 254, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (227, 6, 447, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (228, 1, 266, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (228, 2, 11, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (228, 3, 213, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (228, 4, 477, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (228, 5, 242, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (228, 6, 215, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (229, 1, 377, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (229, 2, 10, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (229, 3, 96, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (229, 4, 11, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (229, 5, 427, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (229, 6, 330, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (230, 1, 210, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (230, 2, 175, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (230, 3, 330, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (230, 4, 248, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (230, 5, 340, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (230, 6, 431, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (231, 1, 227, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (231, 2, 155, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (231, 3, 67, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (231, 4, 87, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (231, 5, 116, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (231, 6, 190, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (232, 1, 394, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (232, 2, 75, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (232, 3, 145, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (232, 4, 489, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (232, 5, 316, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (232, 6, 364, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (233, 1, 146, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (233, 2, 498, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (233, 3, 429, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (233, 4, 82, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (233, 5, 59, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (233, 6, 162, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (234, 1, 64, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (234, 2, 133, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (234, 3, 94, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (234, 4, 287, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (234, 5, 340, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (234, 6, 500, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (235, 1, 75, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (235, 2, 229, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (235, 3, 499, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (235, 4, 273, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (235, 5, 62, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (235, 6, 207, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (236, 1, 393, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (236, 2, 485, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (236, 3, 475, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (236, 4, 79, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (236, 5, 496, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (236, 6, 499, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (237, 1, 169, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (237, 2, 361, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (237, 3, 242, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (237, 4, 496, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (237, 5, 341, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (237, 6, 409, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (238, 1, 373, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (238, 2, 173, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (238, 3, 374, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (238, 4, 460, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (238, 5, 71, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (238, 6, 59, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (239, 1, 12, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (239, 2, 316, 12);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (239, 3, 228, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (239, 4, 47, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (239, 5, 28, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (239, 6, 328, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (240, 1, 298, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (240, 2, 113, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (240, 3, 100, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (240, 4, 42, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (240, 5, 434, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (240, 6, 346, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (241, 1, 499, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (241, 2, 201, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (241, 3, 251, 15);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (241, 4, 308, 24);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (241, 5, 261, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (241, 6, 465, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (242, 1, 203, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (242, 2, 366, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (242, 3, 189, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (242, 4, 190, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (242, 5, 145, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (242, 6, 179, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (243, 1, 500, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (243, 2, 447, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (243, 3, 44, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (243, 4, 372, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (243, 5, 379, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (243, 6, 411, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (244, 1, 147, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (244, 2, 412, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (244, 3, 373, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (244, 4, 71, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (244, 5, 306, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (244, 6, 73, 11);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (245, 1, 155, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (245, 2, 444, 21);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (245, 3, 171, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (245, 4, 477, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (245, 5, 387, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (245, 6, 45, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (246, 1, 209, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (246, 2, 468, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (246, 3, 212, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (246, 4, 284, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (246, 5, 363, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (246, 6, 386, 9);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (247, 1, 102, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (247, 2, 426, 17);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (247, 3, 148, 22);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (247, 4, 251, 6);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (247, 5, 421, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (247, 6, 427, 23);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (248, 1, 155, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (248, 2, 286, 19);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (248, 3, 114, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (248, 4, 405, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (248, 5, 78, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (248, 6, 153, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (249, 1, 427, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (249, 2, 241, 8);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (249, 3, 334, 14);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (249, 4, 213, 10);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (249, 5, 251, 25);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (249, 6, 125, 5);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (250, 1, 61, 13);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (250, 2, 252, 7);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (250, 3, 306, 16);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (250, 4, 297, 20);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (250, 5, 289, 18);
INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES (250, 6, 444, 13);

-- Customers (Shard 2)
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1001, 'Jessica', 'Mcclain', 'hessbeth@example.net', '808.548.8725', '78816 Shaw Shore Apt. 928', 'South Erik', 'OK', '74663');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1002, 'Donna', 'Faulkner', 'ccrosby@example.org', '001-273-214-5303x85677', '84498 Nicholas Lane Suite 918', 'Nicholasbury', 'NC', '53695');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1003, 'Michael', 'Parrish', 'msparks@example.org', '327.523.1843x22259', '1777 Brittany Rue Suite 030', 'New Brittany', 'DC', '83016');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1004, 'William', 'Macdonald', 'brianscott@example.org', '869.490.4137x97723', '842 Nielsen Ranch', 'East Nicholasberg', 'CT', '02671');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1005, 'James', 'Heath', 'mserrano@example.org', '(979)490-8811', '686 Golden Square', 'Perezfort', 'WY', '50470');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1006, 'Michael', 'Ballard', 'colemanjonathan@example.org', '349-286-4300', '356 Rodriguez Meadow Suite 486', 'Cherylfurt', 'WV', '27199');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1007, 'Robert', 'Bowers', 'jwhite@example.net', '844.795.6213x7213', '60127 Davis Greens', 'West Christopher', 'AZ', '95461');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1008, 'Patrick', 'Joyce', 'jennifer90@example.org', '+1-477-203-8430x9883', '02146 Caldwell Lodge Apt. 801', 'New Justinside', 'PW', '76907');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1009, 'Michael', 'Richmond', 'jeremy37@example.com', '001-604-726-8181', '489 Benson Lane', 'Carrillomouth', 'WI', '60643');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1010, 'Erin', 'Mosley', 'olsonjonathan@example.com', '+1-833-756-5880x4341', '275 Robinson Ports', 'Ianborough', 'NM', '97115');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1011, 'James', 'Moss', 'jamie33@example.net', '(721)911-7908x075', '2846 Karen Crossroad Apt. 867', 'New Michaelburgh', 'NH', '16277');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1012, 'Helen', 'Stevens', 'smithjason@example.net', '655-994-2843', '2763 Haynes Landing Suite 647', 'New David', 'OK', '90417');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1013, 'Jeremy', 'Garcia', 'linda86@example.com', '722.970.2672', '8906 Hannah Circle Apt. 471', 'Garnerview', 'MN', '47727');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1014, 'Ann', 'Frederick', 'maurice61@example.com', '+1-893-699-8245x58771', '225 Welch Ports Suite 112', 'Jeremymouth', 'SD', '38689');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1015, 'Jennifer', 'Jacobs', 'cnelson@example.com', '001-498-876-2202x3413', '17800 Warren Corner', 'West Christineland', 'SD', '51598');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1016, 'Kyle', 'Wright', 'scott22@example.net', '(900)455-7784', '979 Mills Route', 'Reginafort', 'ND', '30271');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1017, 'Linda', 'Ramos', 'robert24@example.org', '9826547807', '4930 Lopez Points', 'Fosterburgh', 'VT', '97116');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1018, 'Debbie', 'Clayton', 'josehenderson@example.org', '994.648.4631x22417', '50208 Jacob Cove Suite 427', 'East Christophertown', 'NM', '28968');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1019, 'Matthew', 'Collins', 'dbolton@example.net', '9514204618', '6013 Wise Mills', 'Lake Virginia', 'ID', '60903');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1020, 'Jill', 'Davis', 'thomasmaldonado@example.com', '520-888-1474x35031', '24916 Albert Canyon Suite 925', 'East Ericland', 'TX', '81588');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1021, 'Matthew', 'Booker', 'browndeanna@example.net', '+1-512-273-5857', '2407 Hansen Plains Suite 392', 'Mariomouth', 'KY', '78971');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1022, 'Robin', 'Spencer', 'schmidtshannon@example.com', '+1-757-508-6209', '186 Alexandria Parks Apt. 945', 'Davidsonville', 'CT', '69077');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1023, 'Donna', 'Williams', 'gregoryjohnson@example.org', '531.309.6789x9405', '71705 Short Underpass', 'Port Christinahaven', 'AZ', '96747');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1024, 'Chad', 'Torres', 'susandavis@example.net', '886.333.8392', '761 Laura Plaza Suite 852', 'Mahoneymouth', 'OH', '43054');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1025, 'Megan', 'Gutierrez', 'umckenzie@example.net', '998.836.8457', '049 Zachary Hollow', 'West Traceyborough', 'PR', '41776');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1026, 'Andrew', 'Short', 'samantha88@example.net', '001-721-507-5224', '4196 Jessica Stream', 'Lauraburgh', 'NM', '90887');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1027, 'Jacqueline', 'Weiss', 'larsonkevin@example.net', '001-561-205-5661', '48058 Mark Square Apt. 206', 'Mullinsshire', 'NY', '12308');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1028, 'Jeffrey', 'Roberts', 'vhernandez@example.org', '590.986.4168x6227', '938 John Grove Suite 591', 'Lake Robertstad', 'MI', '25468');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1029, 'Malik', 'Wheeler', 'carrillogary@example.com', '+1-279-527-0335x211', '0514 Ruiz Isle', 'Lake Amanda', 'IL', '72121');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1030, 'Alexandra', 'Green', 'jdean@example.net', '001-606-298-0420x439', '016 Alvarado Shoals Suite 104', 'Hallfurt', 'NY', '93521');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1031, 'Cory', 'Stewart', 'lopezvincent@example.com', '+1-400-238-4576', '554 Wendy Parkway Suite 046', 'New Stacybury', 'FL', '45299');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1032, 'Penny', 'Sandoval', 'blairabigail@example.net', '+1-436-539-2649x578', '832 Barker Pine', 'South Wendy', 'WI', '19526');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1033, 'Diana', 'Cunningham', 'lonniegrant@example.net', '925-620-5664', '12209 Obrien Ridge', 'New Jesse', 'TX', '03919');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1034, 'Michael', 'Watts', 'manderson@example.com', '001-252-667-7223x306', '33127 Watts Way Suite 366', 'New Jillfurt', 'VA', '41513');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1035, 'Phillip', 'Crosby', 'meyershannon@example.org', '588.660.8680', '4472 Phillips Center Apt. 771', 'East Kimberlyside', 'DC', '52021');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1036, 'Robert', 'Hayes', 'shawnmosley@example.org', '814.452.1117x518', '602 Cunningham Shoals Apt. 222', 'South Kylemouth', 'LA', '82611');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1037, 'Henry', 'Roach', 'adamcannon@example.org', '877.980.9733x977', '903 Harvey Point', 'North Jack', 'AR', '86127');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1038, 'Michael', 'Thomas', 'estradamary@example.com', '710-216-2249x99827', '5561 Bridges Circles', 'Thomasville', 'UT', '36469');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1039, 'Mark', 'Gutierrez', 'heathersalazar@example.org', '001-681-779-4695', '978 Vasquez Falls', 'Lake Kelly', 'ID', '00708');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1040, 'David', 'Marshall', 'mclaughlinjared@example.net', '(760)255-8303x44144', '556 Marilyn Fields', 'Marthafort', 'PW', '62694');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1041, 'Laura', 'Brewer', 'dmoore@example.net', '776-308-4958x80395', '0568 Ashley Loaf', 'New Darryl', 'WY', '99006');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1042, 'Kyle', 'Hodge', 'nelsonchristopher@example.org', '(974)238-4215x031', '235 Oconnor Pine Suite 521', 'East Jenny', 'NH', '51302');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1043, 'Jennifer', 'Boyd', 'collinsbradley@example.net', '657-501-8409', '34485 Lambert Groves Apt. 241', 'New Anitaville', 'IL', '71611');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1044, 'Michael', 'Flores', 'sherrybrock@example.net', '421.249.5870', '016 Christopher Lock Apt. 997', 'Larryborough', 'VT', '99906');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1045, 'Emily', 'Ferguson', 'fbradley@example.net', '817.447.7332x945', '7701 Rodriguez Neck Suite 245', 'New Dakota', 'GU', '94122');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1046, 'Laura', 'Nguyen', 'sparksamanda@example.com', '001-363-793-8276', '966 Stephens Freeway', 'Lake Elizabeth', 'WA', '93812');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1047, 'Audrey', 'Tucker', 'gnguyen@example.com', '(946)219-1965', '29022 Schmidt Loaf', 'Gonzalezmouth', 'ME', '75248');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1048, 'Laura', 'Frazier', 'wrobbins@example.org', '001-209-286-2405', '40369 Garrett Station Suite 666', 'Lake Glenn', 'DC', '25172');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1049, 'Angela', 'Bridges', 'mary24@example.net', '(320)410-2762', '9692 Hicks Plaza Suite 653', 'South Cassandra', 'OK', '65795');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1050, 'Melanie', 'Young', 'robert89@example.com', '4096751971', '189 John Roads Apt. 894', 'West Amandatown', 'NJ', '60012');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1051, 'William', 'Harrison', 'robert44@example.org', '2946940792', '7128 Melissa Harbors', 'Davidview', 'KY', '34180');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1052, 'Alexis', 'Rodriguez', 'reneestevenson@example.net', '452.943.7280x512', '3723 Brown Greens Apt. 027', 'Alvarezfort', 'WA', '99123');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1053, 'Sandra', 'Hall', 'jwells@example.net', '(704)676-5801x85694', '49673 April Springs Apt. 580', 'Port Carloschester', 'CT', '69348');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1054, 'Dalton', 'Griffin', 'jessicaking@example.org', '3914093911', '921 Jon Mountain Apt. 746', 'Jonathanland', 'KY', '08678');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1055, 'Patrick', 'Cook', 'scottlisa@example.org', '517.339.6271x286', '410 Chad Stream Suite 707', 'Lake Danielle', 'AZ', '87612');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1056, 'Peter', 'Hernandez', 'rebecca90@example.net', '001-777-766-1830x671', '0158 Miller Mount Suite 328', 'South Donnaport', 'UT', '51632');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1057, 'Peggy', 'Mccoy', 'tom73@example.org', '6309937618', '05050 Wilson Valley Suite 829', 'North Benjamin', 'FL', '64581');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1058, 'Desiree', 'Ruiz', 'sanchezdeborah@example.org', '(304)317-9291', '931 Ronald Valleys Suite 519', 'West Mary', 'WY', '28449');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1059, 'Kathryn', 'Watkins', 'bryan42@example.com', '(358)827-3902', '71002 Jasmine Ramp', 'Robertfort', 'UT', '17133');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1060, 'Jamie', 'Bowman', 'ljenkins@example.net', '001-509-527-9145x608', '195 Steven Road', 'West Brian', 'DE', '20059');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1061, 'Gina', 'Schmitt', 'kjimenez@example.net', '9052436459', '082 Kristen Oval', 'North Pattymouth', 'OR', '76491');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1062, 'Mark', 'Gonzalez', 'jerry15@example.org', '936-236-3179', '39726 Taylor Stravenue Apt. 543', 'Davidshire', 'AR', '37280');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1063, 'Derek', 'York', 'wbarnes@example.com', '349.829.2983', '97740 Fitzgerald Gateway Apt. 569', 'New Sophia', 'PW', '75697');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1064, 'Rachel', 'Butler', 'williamsthomas@example.net', '3682671773', '25431 Timothy Inlet Apt. 799', 'South Stevenberg', 'VI', '92662');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1065, 'Richard', 'Clarke', 'courtney01@example.com', '001-758-204-6498x931', '16579 Michael Extensions Apt. 832', 'Johnville', 'SD', '63218');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1066, 'Jo', 'Goodwin', 'karenhodges@example.com', '(348)964-0155x778', '9513 Miller Lock Apt. 411', 'West Daniel', 'FL', '65555');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1067, 'Edward', 'Harris', 'cartertara@example.net', '(275)567-0431', '9557 Ellis Port Apt. 424', 'South Nathan', 'LA', '06703');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1068, 'Eddie', 'Mitchell', 'christinemartin@example.net', '722-422-3105x9274', '055 Nathan Plains', 'New Kevin', 'PW', '03767');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1069, 'Richard', 'Porter', 'staciereilly@example.org', '9887547492', '702 Kyle Locks', 'South Michael', 'MD', '07714');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1070, 'Cathy', 'Lee', 'kimberlywang@example.org', '7182718637', '2656 Smith Key Suite 478', 'East Jessicamouth', 'WA', '54975');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1071, 'Linda', 'Roberts', 'achandler@example.org', '001-391-823-4785', '64628 Page Throughway', 'East Jacob', 'MS', '38441');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1072, 'Angela', 'Williams', 'mary47@example.net', '001-973-500-2447x1462', '47195 Cunningham Ways', 'Courtneyfort', 'UT', '16175');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1073, 'Nathaniel', 'Quinn', 'brucefrancisco@example.org', '(857)725-2045', '4818 Katie Falls', 'New Karenside', 'MD', '41947');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1074, 'Margaret', 'Cohen', 'joseph51@example.net', '001-852-702-8457', '32833 Robert Club', 'Port Davidtown', 'NJ', '46141');
INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES (1075, 'Larry', 'Cox', 'mpreston@example.net', '001-352-840-1322x34232', '07603 Antonio Shoals', 'South Davidview', 'AZ', '09184');

-- Orders (Shard 2)
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1001, 1018, 2, '2026-04-27 02:32:45', 'Delivered', 3416.9);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1002, 1057, 2, '2026-08-04 18:58:44', 'Delivered', 1265.61);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1003, 1041, 11, '2026-09-05 07:08:30', 'Delivered', 2410.74);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1004, 1071, 9, '2026-10-16 04:13:25', 'Delivered', 2664.64);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1005, 1021, 5, '2026-04-24 08:20:17', 'Delivered', 6020.78);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1006, 1066, 7, '2026-08-12 00:20:38', 'Paid', 1511.01);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1007, 1026, 4, '2026-06-26 06:51:06', 'Shipped', 2773.4);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1008, 1064, NULL, '2026-10-19 11:36:34', 'Shipped', 1699.55);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1009, 1074, 11, '2026-10-02 16:23:28', 'Delivered', 2074.85);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1010, 1071, 4, '2026-08-20 21:02:11', 'Delivered', 745.44);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1011, 1012, 2, '2026-10-17 21:15:51', 'Shipped', 3779.35);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1012, 1062, 13, '2026-06-21 07:07:24', 'Delivered', 361.58);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1013, 1074, 2, '2026-07-30 11:05:43', 'Paid', 2540.2);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1014, 1041, 2, '2026-05-09 19:23:22', 'Delivered', 2431.23);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1015, 1067, 11, '2026-09-28 00:30:57', 'Paid', 1578.6);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1016, 1071, 5, '2026-06-28 03:49:28', 'Delivered', 1532.41);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1017, 1017, 13, '2026-05-28 19:17:37', 'Delivered', 1971.94);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1018, 1008, 3, '2026-09-17 11:14:07', 'Delivered', 1903.66);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1019, 1039, 5, '2026-07-09 07:22:35', 'Paid', 1843.39);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1020, 1029, 11, '2026-08-16 12:44:03', 'Delivered', 4769.8);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1021, 1067, 9, '2026-05-20 11:58:26', 'Delivered', 1209.0);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1022, 1033, 6, '2026-06-24 13:10:12', 'Delivered', 2864.18);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1023, 1071, 8, '2026-09-22 12:54:52', 'Paid', 1716.8);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1024, 1039, 2, '2026-07-03 21:25:19', 'Delivered', 3778.86);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1025, 1022, 4, '2026-08-12 14:27:54', 'Paid', 2749.4);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1026, 1044, 1, '2026-07-05 20:21:24', 'Delivered', 514.67);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1027, 1004, 2, '2026-07-08 21:56:04', 'Pending', 3207.28);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1028, 1074, 8, '2026-06-20 11:15:32', 'Delivered', 2478.64);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1029, 1074, 13, '2026-10-03 17:52:21', 'Delivered', 1661.28);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1030, 1004, 15, '2026-07-18 13:07:51', 'Delivered', 1482.07);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1031, 1070, 9, '2026-05-28 02:19:33', 'Delivered', 3410.25);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1032, 1039, 15, '2026-05-14 17:18:42', 'Shipped', 1866.15);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1033, 1052, 9, '2026-10-05 12:47:23', 'Delivered', 1621.33);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1034, 1008, 5, '2026-10-18 23:14:09', 'Delivered', 1291.71);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1035, 1062, 14, '2026-06-08 07:43:04', 'Shipped', 3343.25);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1036, 1019, 10, '2026-04-25 10:33:41', 'Delivered', 1594.83);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1037, 1041, 11, '2026-07-19 19:29:52', 'Cancelled', 3256.93);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1038, 1017, 11, '2026-10-08 18:27:52', 'Delivered', 2803.35);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1039, 1014, 10, '2026-06-15 10:32:29', 'Shipped', 4523.57);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1040, 1016, 8, '2026-05-19 08:32:27', 'Delivered', 2412.53);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1041, 1019, 3, '2026-06-08 08:02:09', 'Paid', 1863.6);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1042, 1050, 13, '2026-07-03 06:10:07', 'Shipped', 2040.83);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1043, 1021, 10, '2026-09-20 16:08:21', 'Delivered', 4693.5);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1044, 1041, 6, '2026-09-09 02:46:42', 'Delivered', 333.54);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1045, 1064, 14, '2026-08-15 02:02:46', 'Delivered', 1442.59);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1046, 1040, 15, '2026-05-15 20:26:35', 'Pending', 912.55);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1047, 1051, 14, '2026-06-13 09:39:36', 'Cancelled', 1763.0);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1048, 1028, 11, '2026-05-28 01:42:52', 'Pending', 1681.52);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1049, 1037, 15, '2026-07-06 12:45:25', 'Delivered', 7374.96);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1050, 1061, 9, '2026-05-16 14:30:29', 'Delivered', 2145.79);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1051, 1014, 13, '2026-09-27 19:15:28', 'Paid', 823.53);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1052, 1034, 11, '2026-06-17 07:53:34', 'Delivered', 4948.7);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1053, 1047, 1, '2026-05-03 00:44:51', 'Delivered', 765.56);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1054, 1073, 6, '2026-08-30 11:07:44', 'Shipped', 5731.02);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1055, 1037, 2, '2026-06-13 05:21:28', 'Shipped', 2729.4);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1056, 1058, 8, '2026-08-27 03:45:02', 'Delivered', 1636.12);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1057, 1016, 4, '2026-08-06 12:48:25', 'Cancelled', 594.61);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1058, 1051, 11, '2026-08-14 02:50:14', 'Delivered', 899.6);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1059, 1044, 11, '2026-05-30 18:07:24', 'Delivered', 62.69);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1060, 1026, 12, '2026-06-09 22:19:14', 'Delivered', 6512.17);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1061, 1006, 1, '2026-09-23 17:23:40', 'Paid', 2336.38);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1062, 1043, 15, '2026-10-14 00:58:08', 'Delivered', 2374.8);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1063, 1020, 4, '2026-05-23 09:01:47', 'Shipped', 448.29);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1064, 1041, 5, '2026-07-12 11:35:49', 'Shipped', 3212.68);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1065, 1039, 10, '2026-09-28 08:57:38', 'Delivered', 3715.42);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1066, 1066, 15, '2026-05-15 09:38:00', 'Delivered', 1632.01);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1067, 1039, 15, '2026-06-20 06:10:51', 'Delivered', 4712.2);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1068, 1048, 10, '2026-09-20 15:21:21', 'Delivered', 1851.35);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1069, 1054, 9, '2026-06-23 07:31:22', 'Delivered', 2611.42);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1070, 1004, 15, '2026-10-11 21:06:02', 'Shipped', 3164.0);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1071, 1075, 7, '2026-06-21 19:13:31', 'Delivered', 3467.47);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1072, 1075, 15, '2026-06-03 06:22:17', 'Paid', 3874.5);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1073, 1049, 4, '2026-09-09 07:23:29', 'Delivered', 3046.19);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1074, 1032, 1, '2026-09-27 00:24:33', 'Delivered', 2721.62);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1075, 1015, 6, '2026-05-03 15:38:54', 'Pending', 1624.7);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1076, 1041, 13, '2026-07-19 17:39:23', 'Paid', 3809.93);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1077, 1027, 13, '2026-08-10 19:50:41', 'Delivered', 3723.25);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1078, 1061, 1, '2026-07-11 22:30:58', 'Delivered', 2941.37);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1079, 1067, 6, '2026-06-04 12:45:20', 'Delivered', 4780.59);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1080, 1062, 12, '2026-08-28 12:56:02', 'Shipped', 1054.53);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1081, 1023, 14, '2026-09-19 09:22:56', 'Delivered', 2319.54);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1082, 1044, 11, '2026-07-20 17:23:22', 'Delivered', 2373.83);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1083, 1034, 15, '2026-06-05 16:41:35', 'Paid', 3596.68);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1084, 1032, 8, '2026-05-13 01:16:14', 'Delivered', 2595.57);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1085, 1029, 9, '2026-10-16 00:30:11', 'Delivered', 2866.8);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1086, 1027, 15, '2026-09-01 23:34:54', 'Shipped', 5874.64);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1087, 1045, 8, '2026-10-15 06:49:28', 'Shipped', 2462.5);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1088, 1074, 12, '2026-04-26 07:39:10', 'Delivered', 4535.83);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1089, 1051, 11, '2026-04-28 15:11:02', 'Cancelled', 3004.54);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1090, 1019, 9, '2026-08-04 12:47:15', 'Pending', 1216.08);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1091, 1011, 11, '2026-08-26 04:13:21', 'Delivered', 1888.01);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1092, 1033, 15, '2026-09-03 01:37:39', 'Shipped', 3958.94);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1093, 1069, 8, '2026-09-11 17:32:07', 'Delivered', 4159.21);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1094, 1035, 4, '2026-05-16 11:54:30', 'Paid', 217.53);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1095, 1031, 7, '2026-07-28 01:28:43', 'Paid', 753.44);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1096, 1068, 7, '2026-08-03 21:16:46', 'Delivered', 1272.33);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1097, 1007, 3, '2026-09-29 10:00:13', 'Delivered', 708.94);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1098, 1061, 3, '2026-06-30 23:45:35', 'Delivered', 1303.93);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1099, 1018, NULL, '2026-10-18 09:47:20', 'Cancelled', 3150.9);
INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES (1100, 1021, 13, '2026-05-25 05:45:52', 'Delivered', 2646.05);

-- Order Items (Shard 2)
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1001, 36, 2, 307.95, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1001, 193, 1, 111.63, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1001, 174, 1, 682.76, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1001, 145, 1, 698.56, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1001, 43, 2, 936.75, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1002, 192, 1, 130.8, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1002, 158, 3, 455.39, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1003, 230, 1, 758.35, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1003, 32, 3, 999.28, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1004, 110, 2, 854.08, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1004, 64, 2, 356.15, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1004, 64, 3, 356.15, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1005, 73, 3, 451.08, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1005, 217, 3, 691.82, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1005, 53, 3, 905.46, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1005, 49, 3, 640.08, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1006, 201, 1, 790.38, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1006, 29, 1, 803.77, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1006, 153, 1, 506.39, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1007, 93, 2, 42.52, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1007, 221, 3, 323.44, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1007, 140, 3, 333.15, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1007, 121, 1, 288.07, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1007, 18, 1, 879.95, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1008, 16, 2, 923.67, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1009, 129, 2, 425.51, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1009, 103, 1, 909.49, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1009, 138, 3, 448.12, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1010, 21, 3, 322.72, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1011, 40, 3, 601.0, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1011, 151, 3, 171.83, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1011, 167, 3, 83.32, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1011, 80, 3, 564.48, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1011, 245, 1, 160.09, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1012, 112, 1, 502.39, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1013, 80, 3, 564.48, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1013, 190, 1, 625.62, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1013, 182, 1, 736.63, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1014, 244, 2, 206.79, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1014, 201, 3, 790.38, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1015, 192, 2, 130.8, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1015, 31, 1, 452.03, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1015, 110, 2, 854.08, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1016, 250, 3, 53.0, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1016, 128, 2, 949.93, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1017, 220, 3, 875.62, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1018, 198, 1, 551.74, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1018, 173, 3, 643.69, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1019, 1, 1, 222.14, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1019, 4, 1, 845.36, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1019, 94, 2, 437.74, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1019, 46, 1, 536.47, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1020, 190, 3, 625.62, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1020, 83, 1, 747.75, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1020, 185, 2, 872.46, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1020, 20, 3, 535.22, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1020, 129, 3, 425.51, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1021, 206, 3, 430.22, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1021, 245, 2, 160.09, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1022, 73, 2, 451.08, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1022, 142, 2, 766.89, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1022, 52, 2, 558.84, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1023, 160, 1, 245.82, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1023, 152, 2, 992.37, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1024, 188, 3, 463.5, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1024, 63, 1, 587.29, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1024, 105, 1, 808.63, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1024, 89, 3, 582.47, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1025, 244, 2, 206.79, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1025, 169, 2, 698.89, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1025, 187, 2, 375.91, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1025, 136, 1, 128.93, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1025, 247, 1, 686.23, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1026, 72, 1, 439.0, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1026, 60, 3, 39.28, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1027, 118, 3, 557.57, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1027, 25, 3, 290.01, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1027, 210, 2, 122.22, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1027, 146, 1, 102.64, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1027, 247, 1, 686.23, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1028, 81, 2, 672.89, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1028, 189, 2, 825.25, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1029, 20, 1, 535.22, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1029, 198, 3, 551.74, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1030, 116, 2, 107.55, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1030, 31, 3, 452.03, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1031, 116, 2, 107.55, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1031, 219, 1, 957.31, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1031, 207, 3, 372.24, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1031, 181, 3, 651.99, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1032, 220, 2, 875.62, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1032, 183, 1, 188.82, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1033, 13, 3, 171.62, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1033, 210, 1, 122.22, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1033, 104, 2, 695.55, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1034, 25, 2, 290.01, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1034, 204, 1, 124.16, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1034, 16, 1, 923.67, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1035, 96, 3, 951.97, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1035, 166, 1, 632.76, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1035, 67, 1, 84.84, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1035, 17, 1, 126.07, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1036, 33, 1, 493.86, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1036, 213, 2, 513.45, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1036, 242, 2, 93.38, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1037, 111, 3, 754.46, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1037, 8, 2, 437.57, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1037, 45, 2, 379.6, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1037, 48, 2, 168.95, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1037, 227, 1, 639.03, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1038, 63, 3, 587.29, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1038, 106, 3, 437.51, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1038, 23, 2, 561.05, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1039, 165, 3, 407.11, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1039, 206, 3, 430.22, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1039, 98, 3, 784.72, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1040, 125, 2, 580.87, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1040, 129, 2, 425.51, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1040, 47, 1, 939.9, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1041, 230, 2, 758.35, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1041, 121, 3, 288.07, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1042, 60, 1, 39.28, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1042, 169, 1, 698.89, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1042, 209, 3, 649.04, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1043, 57, 3, 40.38, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1043, 205, 2, 595.42, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1043, 215, 1, 889.87, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1043, 152, 2, 992.37, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1043, 179, 2, 504.77, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1044, 180, 2, 231.49, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1045, 145, 1, 698.56, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1045, 208, 2, 58.66, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1045, 45, 2, 379.6, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1046, 155, 1, 923.11, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1047, 85, 3, 92.23, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1047, 34, 2, 18.11, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1047, 236, 2, 751.05, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1048, 181, 1, 651.99, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1048, 217, 3, 691.82, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1049, 96, 3, 951.97, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1049, 102, 3, 965.28, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1049, 78, 2, 256.07, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1049, 41, 3, 327.3, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1049, 203, 3, 288.83, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1050, 45, 3, 379.6, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1050, 178, 3, 405.46, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1050, 58, 3, 172.64, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1051, 79, 3, 231.33, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1051, 33, 1, 493.86, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1052, 243, 3, 782.64, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1052, 198, 3, 551.74, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1052, 155, 2, 923.11, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1052, 248, 3, 327.07, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1052, 145, 1, 698.56, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1053, 191, 1, 78.2, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1053, 82, 1, 817.96, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1054, 211, 3, 614.55, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1054, 187, 2, 375.91, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1054, 68, 1, 850.44, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1054, 18, 2, 879.95, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1054, 28, 3, 658.99, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1055, 188, 2, 463.5, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1055, 227, 2, 639.03, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1055, 97, 2, 546.78, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1056, 123, 3, 313.42, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1056, 176, 1, 999.37, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1057, 217, 1, 691.82, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1058, 244, 1, 206.79, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1058, 44, 2, 545.02, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1059, 242, 1, 93.38, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1060, 229, 2, 780.4, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1060, 111, 3, 754.46, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1060, 228, 2, 429.11, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1060, 26, 2, 481.1, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1060, 49, 2, 640.08, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1061, 187, 3, 375.91, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1061, 73, 2, 451.08, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1061, 13, 2, 171.62, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1061, 216, 2, 109.55, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1062, 110, 1, 854.08, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1062, 170, 3, 368.72, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1062, 52, 1, 558.84, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1063, 75, 1, 247.1, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1063, 30, 2, 153.93, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1064, 230, 3, 758.35, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1064, 165, 3, 407.11, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1064, 95, 2, 338.11, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1065, 68, 2, 850.44, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1065, 58, 2, 172.64, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1065, 39, 3, 680.4, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1066, 89, 3, 582.47, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1067, 59, 3, 212.37, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1067, 100, 3, 128.55, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1067, 138, 3, 448.12, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1067, 122, 3, 980.81, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1068, 21, 2, 322.72, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1068, 183, 1, 188.82, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1068, 231, 3, 433.22, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1069, 159, 1, 464.05, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1069, 194, 2, 675.75, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1069, 43, 1, 936.75, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1069, 33, 1, 493.86, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1070, 112, 1, 502.39, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1070, 161, 1, 709.93, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1070, 67, 2, 84.84, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1070, 235, 1, 151.03, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1070, 143, 2, 996.98, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1071, 134, 2, 302.59, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1071, 4, 3, 845.36, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1071, 134, 2, 302.59, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1071, 39, 1, 680.4, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1071, 150, 1, 492.95, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1072, 26, 2, 481.1, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1072, 226, 2, 871.93, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1072, 68, 2, 850.44, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1073, 122, 1, 980.81, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1073, 104, 1, 695.55, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1073, 175, 3, 644.71, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1074, 226, 2, 871.93, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1074, 13, 3, 171.62, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1074, 69, 2, 417.85, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1075, 78, 2, 256.07, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1075, 126, 3, 264.43, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1075, 249, 1, 597.95, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1075, 250, 3, 53.0, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1076, 69, 3, 417.85, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1076, 166, 1, 632.76, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1076, 55, 2, 687.14, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1076, 195, 3, 730.96, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1077, 132, 1, 631.5, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1077, 182, 3, 736.63, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1077, 200, 3, 645.25, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1077, 8, 1, 437.57, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1078, 215, 1, 889.87, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1078, 117, 1, 588.24, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1078, 181, 1, 651.99, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1078, 211, 2, 614.55, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1079, 32, 3, 999.28, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1079, 96, 2, 951.97, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1079, 46, 2, 536.47, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1080, 42, 2, 405.44, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1080, 177, 1, 369.21, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1081, 42, 3, 405.44, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1081, 55, 1, 687.14, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1081, 174, 1, 682.76, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1082, 6, 3, 507.23, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1082, 234, 1, 984.68, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1082, 154, 1, 980.55, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1083, 242, 2, 93.38, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1083, 182, 3, 736.63, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1083, 230, 2, 758.35, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1084, 56, 2, 753.48, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1084, 134, 3, 302.59, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1084, 27, 1, 664.43, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1085, 216, 2, 109.55, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1085, 153, 3, 506.39, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1085, 176, 1, 999.37, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1085, 87, 2, 424.22, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1086, 67, 3, 84.84, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1086, 229, 3, 780.4, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1086, 39, 3, 680.4, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1086, 231, 1, 433.22, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1086, 206, 3, 430.22, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1087, 36, 3, 307.95, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1087, 128, 2, 949.93, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1088, 100, 3, 128.55, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1088, 182, 3, 736.63, 0.12);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1088, 88, 3, 835.55, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1089, 164, 2, 970.43, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1089, 172, 2, 625.79, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1089, 217, 1, 691.82, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1089, 225, 3, 284.89, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1090, 33, 3, 493.86, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1091, 196, 1, 621.79, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1091, 231, 2, 433.22, 0.1);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1091, 57, 2, 40.38, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1091, 224, 2, 680.17, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1092, 96, 2, 951.97, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1092, 119, 1, 242.84, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1092, 222, 3, 490.46, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1092, 242, 3, 93.38, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1092, 228, 1, 429.11, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1093, 98, 3, 784.72, 0.04);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1093, 14, 1, 191.78, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1093, 52, 2, 558.84, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1093, 146, 2, 102.64, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1093, 221, 3, 323.44, 0.03);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1094, 86, 3, 95.28, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1095, 15, 1, 615.22, 0.07);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1095, 54, 1, 438.9, 0.09);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1096, 202, 1, 228.49, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1096, 112, 3, 502.39, 0.06);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1097, 123, 2, 313.42, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1097, 137, 1, 86.26, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1097, 244, 1, 206.79, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1098, 136, 1, 128.93, 0.0);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1098, 2, 3, 184.39, 0.11);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1098, 58, 3, 172.64, 0.13);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1098, 80, 1, 564.48, 0.02);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1099, 79, 1, 231.33, 0.01);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1099, 12, 2, 754.85, 0.14);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1099, 117, 3, 588.24, 0.08);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1100, 112, 3, 502.39, 0.15);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1100, 88, 2, 835.55, 0.05);
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES (1100, 49, 1, 640.08, 0.14);

-- Payments (Shard 2)
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1001, 3416.9, 'Bank Transfer', 'Completed', '2026-04-27 06:32:45');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1002, 1265.61, 'PayPal', 'Completed', '2026-08-06 00:58:44');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1003, 2410.74, 'Bank Transfer', 'Completed', '2026-09-06 19:08:30');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1004, 2664.64, 'Gift Card', 'Completed', '2026-10-18 02:13:25');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1005, 6020.78, 'Bank Transfer', 'Completed', '2026-04-26 06:20:17');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1006, 1511.01, 'Gift Card', 'Completed', '2026-08-12 08:20:38');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1007, 2773.4, 'Credit Card', 'Completed', '2026-06-28 01:51:06');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1008, 1699.55, 'PayPal', 'Completed', '2026-10-19 12:36:34');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1009, 2074.85, 'Bank Transfer', 'Completed', '2026-10-03 15:23:28');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1010, 745.44, 'Bank Transfer', 'Completed', '2026-08-22 09:02:11');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1011, 3779.35, 'Bank Transfer', 'Completed', '2026-10-19 18:15:51');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1012, 361.58, 'Credit Card', 'Completed', '2026-06-21 10:07:24');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1013, 2540.2, 'PayPal', 'Completed', '2026-07-31 19:05:43');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1014, 2431.23, 'PayPal', 'Completed', '2026-05-11 17:23:22');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1015, 1578.6, 'Gift Card', 'Completed', '2026-09-28 07:30:57');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1016, 1532.41, 'Bank Transfer', 'Completed', '2026-06-29 19:49:28');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1017, 1971.94, 'PayPal', 'Completed', '2026-05-29 08:17:37');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1018, 1903.66, 'Credit Card', 'Completed', '2026-09-18 13:14:07');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1019, 1843.39, 'PayPal', 'Completed', '2026-07-10 13:22:35');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1020, 4769.8, 'PayPal', 'Completed', '2026-08-18 10:44:03');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1021, 1209.0, 'Bank Transfer', 'Completed', '2026-05-20 18:58:26');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1022, 2864.18, 'Gift Card', 'Completed', '2026-06-24 16:10:12');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1023, 1716.8, 'Credit Card', 'Completed', '2026-09-23 17:54:52');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1024, 3778.86, 'Gift Card', 'Completed', '2026-07-05 16:25:19');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1025, 2749.4, 'PayPal', 'Completed', '2026-08-13 22:27:54');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1026, 514.67, 'Credit Card', 'Completed', '2026-07-07 06:21:24');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1027, 3207.28, 'Credit Card', 'Pending', '2026-07-10 09:56:04');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1028, 2478.64, 'Gift Card', 'Completed', '2026-06-22 01:15:32');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1029, 1661.28, 'Gift Card', 'Completed', '2026-10-05 02:52:21');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1030, 1482.07, 'PayPal', 'Completed', '2026-07-20 10:07:51');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1031, 3410.25, 'PayPal', 'Completed', '2026-05-30 01:19:33');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1032, 1866.15, 'PayPal', 'Completed', '2026-05-15 00:18:42');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1033, 1621.33, 'Gift Card', 'Completed', '2026-10-07 07:47:23');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1034, 1291.71, 'Bank Transfer', 'Completed', '2026-10-20 08:14:09');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1035, 3343.25, 'Gift Card', 'Completed', '2026-06-09 10:43:04');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1036, 1594.83, 'PayPal', 'Completed', '2026-04-26 04:33:41');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1037, 3256.93, 'Gift Card', 'Failed', '2026-07-20 17:29:52');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1038, 2803.35, 'Bank Transfer', 'Completed', '2026-10-09 23:27:52');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1039, 4523.57, 'PayPal', 'Completed', '2026-06-15 19:32:29');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1040, 2412.53, 'Gift Card', 'Completed', '2026-05-20 23:32:27');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1041, 1863.6, 'Bank Transfer', 'Completed', '2026-06-10 05:02:09');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1042, 2040.83, 'Bank Transfer', 'Completed', '2026-07-05 04:10:07');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1043, 4693.5, 'PayPal', 'Completed', '2026-09-21 05:08:21');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1044, 333.54, 'PayPal', 'Completed', '2026-09-10 18:46:42');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1045, 1442.59, 'Bank Transfer', 'Completed', '2026-08-16 22:02:46');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1046, 912.55, 'Bank Transfer', 'Pending', '2026-05-17 16:26:35');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1047, 1763.0, 'PayPal', 'Failed', '2026-06-15 07:39:36');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1048, 1681.52, 'PayPal', 'Pending', '2026-05-29 10:42:52');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1049, 7374.96, 'Bank Transfer', 'Completed', '2026-07-08 10:45:25');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1050, 2145.79, 'Credit Card', 'Completed', '2026-05-17 13:30:29');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1051, 823.53, 'Gift Card', 'Completed', '2026-09-29 09:15:28');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1052, 4948.7, 'Gift Card', 'Completed', '2026-06-19 03:53:34');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1053, 765.56, 'Bank Transfer', 'Completed', '2026-05-04 04:44:51');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1054, 5731.02, 'Credit Card', 'Completed', '2026-08-31 21:07:44');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1055, 2729.4, 'Credit Card', 'Completed', '2026-06-13 07:21:28');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1056, 1636.12, 'Gift Card', 'Completed', '2026-08-27 13:45:02');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1057, 594.61, 'Credit Card', 'Failed', '2026-08-08 07:48:25');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1058, 899.6, 'Credit Card', 'Completed', '2026-08-14 15:50:14');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1059, 62.69, 'Bank Transfer', 'Completed', '2026-05-31 05:07:24');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1060, 6512.17, 'Bank Transfer', 'Completed', '2026-06-11 18:19:14');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1061, 2336.38, 'Bank Transfer', 'Completed', '2026-09-24 03:23:40');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1062, 2374.8, 'Credit Card', 'Completed', '2026-10-15 21:58:08');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1063, 448.29, 'Bank Transfer', 'Completed', '2026-05-23 23:01:47');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1064, 3212.68, 'Credit Card', 'Completed', '2026-07-13 10:35:49');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1065, 3715.42, 'Gift Card', 'Completed', '2026-09-28 15:57:38');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1066, 1632.01, 'PayPal', 'Completed', '2026-05-17 09:38:00');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1067, 4712.2, 'Gift Card', 'Completed', '2026-06-20 22:10:51');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1068, 1851.35, 'Bank Transfer', 'Completed', '2026-09-22 12:21:21');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1069, 2611.42, 'Credit Card', 'Completed', '2026-06-24 08:31:22');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1070, 3164.0, 'Gift Card', 'Completed', '2026-10-13 00:06:02');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1071, 3467.47, 'Bank Transfer', 'Completed', '2026-06-23 07:13:31');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1072, 3874.5, 'Credit Card', 'Completed', '2026-06-03 07:22:17');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1073, 3046.19, 'Bank Transfer', 'Completed', '2026-09-09 20:23:29');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1074, 2721.62, 'Gift Card', 'Completed', '2026-09-27 15:24:33');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1075, 1624.7, 'Bank Transfer', 'Pending', '2026-05-05 05:38:54');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1076, 3809.93, 'PayPal', 'Completed', '2026-07-21 16:39:23');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1077, 3723.25, 'PayPal', 'Completed', '2026-08-11 14:50:41');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1078, 2941.37, 'Gift Card', 'Completed', '2026-07-12 10:30:58');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1079, 4780.59, 'Credit Card', 'Completed', '2026-06-05 00:45:20');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1080, 1054.53, 'PayPal', 'Completed', '2026-08-30 12:56:02');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1081, 2319.54, 'Credit Card', 'Completed', '2026-09-20 10:22:56');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1082, 2373.83, 'Credit Card', 'Completed', '2026-07-21 21:23:22');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1083, 3596.68, 'Bank Transfer', 'Completed', '2026-06-07 04:41:35');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1084, 2595.57, 'Bank Transfer', 'Completed', '2026-05-13 10:16:14');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1085, 2866.8, 'PayPal', 'Completed', '2026-10-17 14:30:11');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1086, 5874.64, 'Bank Transfer', 'Completed', '2026-09-02 00:34:54');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1087, 2462.5, 'Bank Transfer', 'Completed', '2026-10-16 12:49:28');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1088, 4535.83, 'PayPal', 'Completed', '2026-04-26 10:39:10');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1089, 3004.54, 'PayPal', 'Failed', '2026-04-29 12:11:02');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1090, 1216.08, 'Credit Card', 'Pending', '2026-08-06 05:47:15');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1091, 1888.01, 'Bank Transfer', 'Completed', '2026-08-27 12:13:21');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1092, 3958.94, 'Bank Transfer', 'Completed', '2026-09-03 06:37:39');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1093, 4159.21, 'Bank Transfer', 'Completed', '2026-09-13 03:32:07');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1094, 217.53, 'PayPal', 'Completed', '2026-05-16 23:54:30');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1095, 753.44, 'Credit Card', 'Completed', '2026-07-29 10:28:43');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1096, 1272.33, 'PayPal', 'Completed', '2026-08-05 00:16:46');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1097, 708.94, 'Gift Card', 'Completed', '2026-09-29 16:00:13');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1098, 1303.93, 'Bank Transfer', 'Completed', '2026-07-01 14:45:35');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1099, 3150.9, 'PayPal', 'Failed', '2026-10-20 04:47:20');
INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES (1100, 2646.05, 'Bank Transfer', 'Completed', '2026-05-26 03:45:52');

-- Shipments (Shard 2)
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1001, 6, 'DHL', 'FB834299', '2026-04-28 02:32:45', '2026-05-04 02:32:45');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1002, 5, 'DHL', '295094BB', '2026-08-07 18:58:44', '2026-08-12 18:58:44');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1003, 5, 'Amazon Logistics', '0452BA51', '2026-09-07 07:08:30', '2026-09-11 07:08:30');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1004, 6, 'USPS', '9B806A19', '2026-10-19 04:13:25', '2026-10-24 04:13:25');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1005, 6, 'UPS', '276A7D9A', '2026-04-29 08:20:17', '2026-05-02 08:20:17');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1007, 4, 'FedEx', 'AB9C405D', '2026-07-01 06:51:06', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1008, 4, 'DHL', '277F1725', '2026-10-22 11:36:34', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1009, 4, 'USPS', 'FDA5E1D1', '2026-10-07 16:23:28', '2026-10-08 16:23:28');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1010, 5, 'FedEx', '2F234D87', '2026-08-24 21:02:11', '2026-08-26 21:02:11');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1011, 2, 'UPS', '5A8EA2F5', '2026-10-22 21:15:51', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1012, 6, 'DHL', '2EDBBD89', '2026-06-23 07:07:24', '2026-06-25 07:07:24');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1014, 2, 'FedEx', 'FE2EE066', '2026-05-12 19:23:22', '2026-05-17 19:23:22');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1016, 6, 'UPS', '5F209033', '2026-06-30 03:49:28', '2026-07-04 03:49:28');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1017, 3, 'UPS', '63BD916B', '2026-06-01 19:17:37', '2026-06-07 19:17:37');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1018, 4, 'USPS', 'A2ABA713', '2026-09-19 11:14:07', '2026-09-24 11:14:07');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1020, 2, 'USPS', 'DD4F6DE8', '2026-08-17 12:44:03', '2026-08-19 12:44:03');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1021, 1, 'FedEx', 'DAE6C21B', '2026-05-25 11:58:26', '2026-05-30 11:58:26');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1022, 2, 'FedEx', '0E3020B6', '2026-06-29 13:10:12', '2026-06-30 13:10:12');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1024, 5, 'FedEx', 'CB00EBBF', '2026-07-04 21:25:19', '2026-07-06 21:25:19');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1026, 3, 'FedEx', 'D3E26347', '2026-07-10 20:21:24', '2026-07-14 20:21:24');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1028, 5, 'Amazon Logistics', 'AB43BD83', '2026-06-21 11:15:32', '2026-06-27 11:15:32');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1029, 6, 'DHL', '8F1372BB', '2026-10-04 17:52:21', '2026-10-06 17:52:21');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1030, 4, 'Amazon Logistics', '1F3D0200', '2026-07-22 13:07:51', '2026-07-29 13:07:51');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1031, 4, 'FedEx', '2603E8CD', '2026-05-30 02:19:33', '2026-06-06 02:19:33');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1032, 4, 'Amazon Logistics', '125D5CCD', '2026-05-16 17:18:42', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1033, 5, 'FedEx', '2CAD002A', '2026-10-10 12:47:23', '2026-10-16 12:47:23');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1034, 5, 'DHL', '823B576B', '2026-10-20 23:14:09', '2026-10-26 23:14:09');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1035, 6, 'DHL', '66384B25', '2026-06-12 07:43:04', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1036, 5, 'Amazon Logistics', 'B8582767', '2026-04-26 10:33:41', '2026-04-28 10:33:41');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1038, 4, 'USPS', '62D884EE', '2026-10-10 18:27:52', '2026-10-11 18:27:52');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1039, 1, 'FedEx', '46DF90FB', '2026-06-20 10:32:29', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1040, 5, 'USPS', '5C8D5E9D', '2026-05-21 08:32:27', '2026-05-26 08:32:27');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1042, 1, 'FedEx', '129DDFDE', '2026-07-07 06:10:07', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1043, 5, 'Amazon Logistics', 'A04F3F5C', '2026-09-21 16:08:21', '2026-09-28 16:08:21');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1044, 5, 'Amazon Logistics', '16236B47', '2026-09-10 02:46:42', '2026-09-11 02:46:42');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1045, 4, 'FedEx', '4485E60D', '2026-08-20 02:02:46', '2026-08-25 02:02:46');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1049, 1, 'USPS', 'C4349170', '2026-07-11 12:45:25', '2026-07-15 12:45:25');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1050, 3, 'UPS', '54777E31', '2026-05-21 14:30:29', '2026-05-25 14:30:29');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1052, 2, 'USPS', '91CFB235', '2026-06-21 07:53:34', '2026-06-24 07:53:34');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1053, 5, 'Amazon Logistics', '9383F057', '2026-05-04 00:44:51', '2026-05-08 00:44:51');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1054, 2, 'DHL', 'FC199EBC', '2026-09-03 11:07:44', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1055, 2, 'UPS', '736B8385', '2026-06-16 05:21:28', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1056, 5, 'Amazon Logistics', 'CE0AE1DD', '2026-08-31 03:45:02', '2026-09-03 03:45:02');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1058, 2, 'UPS', 'CDAD7736', '2026-08-15 02:50:14', '2026-08-20 02:50:14');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1059, 5, 'UPS', '04A624F3', '2026-06-04 18:07:24', '2026-06-05 18:07:24');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1060, 4, 'FedEx', 'F9F4FBCD', '2026-06-12 22:19:14', '2026-06-16 22:19:14');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1062, 3, 'UPS', '1234F672', '2026-10-16 00:58:08', '2026-10-20 00:58:08');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1063, 6, 'Amazon Logistics', '7F02671B', '2026-05-26 09:01:47', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1064, 3, 'Amazon Logistics', 'A960BD87', '2026-07-16 11:35:49', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1065, 5, 'DHL', '12C33D13', '2026-10-03 08:57:38', '2026-10-06 08:57:38');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1066, 6, 'USPS', '3E5FE7F5', '2026-05-17 09:38:00', '2026-05-21 09:38:00');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1067, 5, 'Amazon Logistics', 'E7EB7BAE', '2026-06-24 06:10:51', '2026-06-26 06:10:51');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1068, 3, 'Amazon Logistics', '7677450F', '2026-09-25 15:21:21', '2026-09-29 15:21:21');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1069, 3, 'DHL', '7433005A', '2026-06-28 07:31:22', '2026-07-01 07:31:22');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1070, 6, 'USPS', 'F473BDB4', '2026-10-13 21:06:02', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1071, 6, 'UPS', '12FE55F5', '2026-06-23 19:13:31', '2026-06-27 19:13:31');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1073, 6, 'FedEx', 'E4A8844F', '2026-09-10 07:23:29', '2026-09-12 07:23:29');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1074, 5, 'USPS', 'CC4282CD', '2026-09-30 00:24:33', '2026-10-07 00:24:33');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1077, 5, 'Amazon Logistics', '2F74B072', '2026-08-11 19:50:41', '2026-08-13 19:50:41');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1078, 4, 'UPS', '63AFF1A4', '2026-07-12 22:30:58', '2026-07-19 22:30:58');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1079, 2, 'USPS', '75DB9C81', '2026-06-09 12:45:20', '2026-06-13 12:45:20');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1080, 1, 'UPS', '93A79138', '2026-08-31 12:56:02', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1081, 2, 'DHL', '9F23A1B5', '2026-09-20 09:22:56', '2026-09-25 09:22:56');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1082, 1, 'USPS', '6B9C7D7C', '2026-07-24 17:23:22', '2026-07-29 17:23:22');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1084, 6, 'Amazon Logistics', 'A32CCEAE', '2026-05-16 01:16:14', '2026-05-22 01:16:14');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1085, 5, 'UPS', 'A186EF6F', '2026-10-18 00:30:11', '2026-10-24 00:30:11');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1086, 4, 'USPS', 'EA74B216', '2026-09-02 23:34:54', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1087, 2, 'Amazon Logistics', '33F8CF8C', '2026-10-18 06:49:28', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1088, 2, 'UPS', 'A145676D', '2026-05-01 07:39:10', '2026-05-06 07:39:10');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1091, 5, 'FedEx', '4F0B5593', '2026-08-31 04:13:21', '2026-09-02 04:13:21');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1092, 6, 'UPS', '8332D1B9', '2026-09-06 01:37:39', NULL);
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1093, 2, 'UPS', '94061F23', '2026-09-13 17:32:07', '2026-09-14 17:32:07');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1096, 3, 'USPS', '3BB1591B', '2026-08-06 21:16:46', '2026-08-12 21:16:46');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1097, 4, 'USPS', '28960C25', '2026-10-04 10:00:13', '2026-10-06 10:00:13');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1098, 5, 'UPS', '5A1AE461', '2026-07-01 23:45:35', '2026-07-02 23:45:35');
INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES (1100, 5, 'DHL', '595EF944', '2026-05-30 05:45:52', '2026-06-04 05:45:52');

-- Reviews (Shard 2)
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (173, 1005, 3, NULL, '2026-07-15 21:24:34');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (197, 1004, 3, 'Risk when arm mother through significant truth. Bag seek eye second statement.
Role office instead society sound young. Their conference force serve. Type guy wish case his science.
Can main new. Accept trade might any up appear door.', '2026-06-22 12:08:08');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (20, 1071, 3, 'Serious nothing receive happen tax off station. Among perhaps mouth amount tell less.
Product election event picture weight. Five section while. Really understand different bed newspaper.', '2026-08-17 23:30:08');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (194, 1063, 4, NULL, '2026-09-24 03:39:52');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (190, 1011, 3, NULL, '2026-06-21 18:21:02');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (11, 1009, 5, 'Administration culture son as mean agree. Western race attack discover rise week. Market behind institution get key artist.
Eight avoid early for. Note argue heart enough seat degree.', '2026-09-30 00:25:59');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (27, 1047, 4, 'How western hear light sign wife year. Suggest soon become enter talk south beyond. Clearly owner it drop.
Real page look skill. Decision your if else.
Tv focus several spring various time least. Teacher present election keep truth perform remember difference.', '2026-09-27 22:31:20');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (199, 1051, 5, 'Opportunity change part son low star television foreign. Real camera home trip kind.
Ready performance cut where buy about strategy. World degree choice similar it. Right character campaign last level data away though.', '2026-10-07 07:13:39');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (129, 1018, 3, 'Car many adult. List serve media into inside he.
Store add always religious course meet.
Third somebody watch rock executive language. Organization population decade mission design onto. Quickly security stuff remain success our back.', '2026-07-17 19:05:03');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (15, 1065, 5, 'Direction administration record consumer late scientist. Case cover option most. Voice feel step upon claim.
Second receive ask message may center whole. Late poor power around price. Attack mission his baby rule.', '2026-08-05 22:08:45');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (30, 1075, 5, 'Drop about per truth child house budget. Arrive they individual his car between follow.
Range image everyone material unit water follow. Thousand goal yard common like ever. Appear model front.', '2026-08-13 11:48:21');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (64, 1033, 4, NULL, '2026-05-26 02:36:13');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (17, 1016, 4, 'Student star test room laugh. Impact animal performance special environmental. Mention in community something four.
Particularly movement air participant their section defense.', '2026-07-19 21:35:43');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (167, 1075, 4, 'Of marriage police. Of quality thousand once physical. And price it collection pay establish practice.
Wide government most window cause.
Particular that light such child. Benefit season professor likely mouth. Guy half we prevent at tonight scene.', '2026-08-03 23:11:06');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (189, 1031, 5, NULL, '2026-10-08 22:14:39');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (196, 1014, 3, 'Close information lose up decide. Court able idea successful degree whom. He word morning throw. Light may far chair.
Start none increase nature structure value. Dog least certain president. Late me often wonder.
Likely still argue remain someone. First evening son my point argue.', '2026-07-24 00:37:46');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (231, 1057, 4, 'Around ok hard would several phone cold step. Measure nearly kitchen day age. Where rate human character.
Race Congress very skill owner place. Scene natural southern between up positive. Mission hit pretty several member card space. According I resource sure other their another.', '2026-08-16 16:30:30');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (52, 1008, 4, 'She style probably they. Follow future amount such.
Put allow camera behavior long page. Might represent exactly and happen. Mr bit baby ask thousand week prepare.
View within soldier surface. Hundred wrong box physical hour.', '2026-07-06 20:10:31');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (226, 1015, 3, 'West sport at design care floor. Serve media decade budget old. Hand relationship civil travel protect production do.
Which similar decade also north become. Happy relate fight clear start dinner feel. Take say attention get school Mr.', '2026-09-09 10:23:50');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (47, 1032, 5, 'Population wall through between. Study property hit threat relate. Stage data main last ago.
Special teacher movie eye PM drop cut various. Interesting table girl usually.
Rise one religious cost newspaper country help.', '2026-06-17 18:14:11');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (88, 1019, 3, 'Party name authority write rise. Network through major pay administration listen.
Authority change fight sport build family pattern deep. Artist fight house guess think cell. Spend body himself majority campaign design.', '2026-09-06 03:18:25');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (23, 1040, 1, 'Win sea free. Rock without story site. Single understand eight near loss.
Treat director a light drop do education. Every rule receive health lot oil.
Group boy recent open. Military operation first as themselves account add.', '2026-09-03 16:03:46');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (212, 1005, 5, 'Piece war address sometimes. Nature best past if. Floor feeling former law apply politics prepare.
Tell state prevent each.
Walk conference sea activity almost continue. Continue maybe them.
Push trip catch. Scientist benefit small agree important. Billion away floor.', '2026-05-31 19:28:15');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (236, 1007, 4, 'Serve eight fill difference. Court politics hair military.
Citizen run effect strategy in. Four describe control hundred significant.
Kind soldier community on involve cover community approach. Week easy seek PM list toward start everybody.', '2026-08-30 00:23:02');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (238, 1031, 3, 'Trouble indicate black list yeah despite identify ok. City there since we under hour.
Full night recognize record imagine. Necessary fund economic face theory religious wrong. Type character billion little church leader population.', '2026-09-19 09:47:06');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (87, 1047, 5, 'Skin baby benefit team purpose matter big. Pretty reason because each market decade capital. Likely coach store about. Event party sport where.
To hit every debate capital business experience.
Should situation kind contain politics stuff security yard. Home reflect general if.', '2026-10-09 08:22:29');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (41, 1069, 5, 'Least per later public in threat difference. Determine book bit hope college size.
Box simply east. Evening one seven ball difficult evening evening live. Street prevent day rate move beyond.
Nation reality become artist author its over.
Yes training before hundred.', '2026-08-11 18:45:47');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (126, 1050, 1, 'Trouble yourself security authority per always. Certain western show election time.
Network thousand you decide culture. Article long worker benefit study up. Day myself arrive food.
Talk this so break. Site best radio unit. You field less.
Wife minute sort because.', '2026-07-03 04:40:26');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (183, 1033, 3, 'Support happy herself team could author never. Also PM feeling wife. Business officer experience economic charge give.
Report bar friend former.
Professional whole control at natural sport front your. Serious market find avoid. Plan executive result assume.', '2026-09-23 17:25:59');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (61, 1031, 3, 'Choose identify set gun happen else them. Against amount family your TV born development.
Possible which technology end skin mention sing. Theory about point spend. Must arrive evening will service magazine.', '2026-06-29 05:02:04');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (143, 1021, 5, 'Opportunity father ability begin risk never laugh sort. Health site relate very get. Step watch fire.
Until clearly poor option type account. Eye policy very grow majority wonder. Service model ahead unit admit authority time bill.
Drug baby four service skill member. Upon enjoy light improve.', '2026-06-14 05:16:29');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (25, 1053, 4, NULL, '2026-09-29 10:49:59');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (145, 1011, 5, 'Develop produce rise responsibility. Use tough state I office.
Need when trip six or fill. Name everything office. Street owner involve.
Grow check part myself address.
Home inside drive. Series he throw bar five know behavior.', '2026-09-19 10:02:14');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (4, 1061, 4, 'Policy support fast feeling. Teacher Congress sort speech mother push drive. Too company feeling above. Event lawyer call.
Garden walk huge blue movement firm. Suffer once agreement company material.
Class clearly laugh. You defense price per full. Fact consider develop bar policy TV cause hit.', '2026-10-03 19:48:12');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (55, 1043, 4, 'Before citizen magazine week outside stop ago beautiful. Must shoulder toward grow drive compare image. Decide teach strong how worry standard seem will. Stuff only matter few.
Continue and believe. Any office poor deep people majority maintain page. Around against remember.', '2026-07-03 23:38:03');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (48, 1013, 5, 'Bar his physical let site. Expect heavy kid explain.
Actually science past war good question. Turn prove wind into.
Future general probably possible service at. Six civil beautiful. Live area product something person choose.
Push hospital personal quite. Agency pick local into friend career.', '2026-05-30 14:02:32');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (71, 1065, 2, 'Law from traditional now Mrs.
Reflect available century join outside. Maybe herself partner camera long who require billion.
Soon market garden author world. Try cause behind single project. Sport sound clear.', '2026-09-18 22:59:29');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (226, 1071, 4, 'Employee kid fall international clearly sport. Explain happen build fill personal fire when. Can nothing force move free body stand approach.
Seek then represent conference. Science reduce pass once democratic. Term authority offer feeling than.', '2026-07-18 09:01:08');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (135, 1004, 4, 'Agency discover particularly care fall new subject.
Cover population thing really unit. First response house hundred role.
Culture picture provide support six space.
Above attack catch soldier charge. Through result military. Truth call stage significant thank data year.', '2026-10-01 07:18:41');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (244, 1024, 4, 'True three theory outside agency world true evidence. Box could end.
Traditional us hear station. Back together factor. Little skin most real.
There describe model meeting police rock along. Point article article drop give.', '2026-08-04 21:02:19');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (25, 1018, 1, NULL, '2026-07-16 12:51:53');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (54, 1040, 3, NULL, '2026-08-17 16:22:01');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (127, 1021, 3, 'Subject late energy before until also thousand. If paper really position.
Reduce job blood middle home wonder military. Both notice like story just often.
Professional civil assume thank rest. Four without debate. Eight poor attack girl force.', '2026-08-24 09:36:39');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (177, 1017, 5, 'Analysis race much environment interesting nature painting. Above themselves dark charge middle. Citizen stay condition senior involve.
Effort attorney he school article. Call military want interview why above. Level couple trip movement nor line though.', '2026-10-14 20:12:59');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (92, 1041, 4, 'These may cell campaign. Present TV cup sister article kind bar.
Still respond everything. Far face describe question appear.
World behind people up Republican interview build. Old listen heavy report its sign I lay. American participant race model doctor.', '2026-08-19 22:01:40');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (148, 1018, 3, 'Whatever consumer study often set. Worker region learn gun expect. Instead several free small only. Traditional forget seat benefit.
Remember travel industry air allow husband. Occur decade energy light from lay news.
Five medical research group thus. Cost exist idea now stand his wife represent.', '2026-05-23 07:36:44');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (110, 1042, 4, NULL, '2026-05-30 11:02:16');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (240, 1054, 3, 'Again hospital anyone fight.
Floor operation nice. Evidence station many boy west data. These receive cup doctor.
High require strategy customer actually. Arm also appear star. Doctor network minute road special finally station whose.', '2026-07-12 18:49:35');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (46, 1049, 5, 'Individual because show hour move poor. Small bank world purpose investment at table.
Sister thus wonder shoulder suggest. Treat detail year tell because woman. Water purpose score across party market dark.', '2026-07-03 21:31:53');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (89, 1029, 1, NULL, '2026-08-10 06:17:16');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (95, 1072, 4, 'Name town project agency rock however. Least husband option contain.
Kitchen store method now reach language. Beat house stage college nearly political. Whose a fact on space not blood.
Performance lose charge follow owner many. Agent stuff treatment hard score. First under truth.', '2026-08-07 19:10:12');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (54, 1012, 5, NULL, '2026-07-29 22:49:54');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (57, 1022, 1, 'Mouth bag box with moment always their. Similar above owner energy organization police.
Night threat glass leg anyone do admit. Operation adult big theory. Plant as medical structure already every.
Husband poor general. Class surface impact decision. Plant administration collection among.', '2026-09-24 11:22:22');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (29, 1034, 2, 'Hospital professional our top question. Eight result myself manage decade position education.
Effort right exactly pretty to. Production industry until method program their media. No task product unit pressure.', '2026-10-11 07:53:11');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (247, 1022, 5, NULL, '2026-08-14 10:16:57');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (31, 1068, 4, 'Term all agency right figure son. Yes all company especially less run. Anything culture common. Serve note recent land trip majority center will.
Play two project wide above. Understand as case next go great put. Feel gas price.', '2026-09-11 16:16:21');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (28, 1059, 5, 'Year cold group those stage.
Its put town south gas reality model. Development court resource glass fall west employee.
Sometimes statement personal. Discussion behind live top fight stock fine range. Recognize under individual listen name blue lay.', '2026-06-11 12:28:21');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (34, 1029, 4, NULL, '2026-06-25 13:23:50');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (191, 1035, 3, 'Message moment memory. Hot add perform arrive number base. Drive so dog peace from available.
Financial allow form past. Music truth by quality rich key quality beyond. Weight democratic sit still.
Most although maybe sure bed factor charge. Hard staff husband hand. Need size down east.', '2026-09-19 05:42:42');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (140, 1028, 5, NULL, '2026-07-05 12:07:06');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (11, 1025, 4, 'Rate talk professor. Low budget politics fly impact raise boy pull.
Call tough whether speak travel degree class born. Center pass season room major star. Church order east note.
Kind quickly itself machine significant grow. Message later a poor get organization peace.', '2026-08-26 19:20:59');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (83, 1019, 1, 'Alone defense vote point they color first hundred. Another possible answer across sit small. Impact ready quickly father attention.
Small must benefit away during. Professor land author the finish during exactly.
Nation civil able dog. College someone community side science rate baby.', '2026-06-16 22:29:10');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (29, 1031, 4, 'Recognize between anyone listen across. Its especially half some.
Fly Congress learn more ball body sit send. Enter politics gun various inside line pattern general. State outside law material door land.
Matter seek suffer drive great blood score. Type key despite agent guy debate.', '2026-07-17 20:49:23');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (71, 1048, 4, 'Few skin though compare. Daughter despite father quite author lead. Range company provide hear.
Dinner over wrong say debate type energy. Success home help.
Or total until describe necessary single. Able everything detail raise turn. Husband dinner successful she office.', '2026-06-04 07:37:19');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (151, 1011, 1, NULL, '2026-05-31 06:59:58');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (79, 1042, 5, 'Help view certain. Bank later campaign church.
Million after movie land. Significant watch present summer lose quality moment rock. Prevent strategy local expect pass person arm.
Blood buy evidence table. Write green scene need movement bill.
Baby deep song take tend finish.', '2026-07-21 01:14:45');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (245, 1028, 4, 'Design trial medical become stuff deep. Possible thought apply most way recently box debate. Matter international management. Somebody receive boy develop worker.
Tv sort drug like technology forget. Already summer financial own argue live clear ground.', '2026-07-15 21:06:36');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (111, 1033, 2, 'Place certainly focus which garden just evening street. Follow thing at school.
Test today toward blood reflect consider could. Building my do.
Group best debate significant edge. Behind hope simply owner across. Our miss say simple perform practice investment. Gun small Mrs career everyone.', '2026-07-25 14:55:15');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (139, 1007, 3, NULL, '2026-09-26 04:36:51');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (73, 1046, 5, 'Hundred ask theory democratic perform court. Laugh long carry long difficult family.
Figure practice position same.
Read modern social return. In treatment continue doctor.
Top behind name possible financial. Collection set need table choice. Church evidence speak.', '2026-06-29 04:06:21');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (214, 1006, 1, 'Per assume court although find player feel. Wrong range perhaps meet station history. Property start audience poor. Himself pattern Congress official wrong along.
Lose represent item professional yourself. Community collection get discuss himself notice behavior assume.', '2026-08-31 06:39:15');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (48, 1049, 3, 'Discover draw decade he voice scene high total. Rule meet simply gun explain. Eat no himself per card.
Again especially future strategy officer girl. Plant very southern writer participant these TV. Tend eat interview toward them instead force follow.', '2026-08-08 20:43:29');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (18, 1048, 2, 'While involve open particularly election administration red. Record talk against tell talk once be. Perform traditional ball white Democrat.
Someone week usually large from. Stop industry road a full myself measure. Rather his product.', '2026-05-26 00:58:26');
INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES (211, 1006, 4, NULL, '2026-09-25 04:40:19');

COMMIT;
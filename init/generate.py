#!/usr/bin/env python3

import random
import itertools
from datetime import datetime, timedelta
from faker import Faker

fake = Faker()
Faker.seed(42)
random.seed(42)

NUM_CUSTOMERS = 150
NUM_SUPPLIERS = 25
NUM_WAREHOUSES = 6
NUM_PRODUCTS = 250
NUM_COUPONS = 15
NUM_ORDERS = 200
NUM_REVIEWS = 150


def esc(s):
    return s.replace("'", "''") if s else ""


category_names = [
    ("Electronics", None),
    ("Smartphones", "Electronics"),
    ("Laptops", "Electronics"),
    ("Audio", "Electronics"),
    ("Clothing", None),
    ("Men's Apparel", "Clothing"),
    ("Women's Apparel", "Clothing"),
    ("Footwear", "Clothing"),
    ("Home & Kitchen", None),
    ("Furniture", "Home & Kitchen"),
    ("Cookware", "Home & Kitchen"),
    ("Decor", "Home & Kitchen"),
    ("Books", None),
    ("Fiction", "Books"),
    ("Non-Fiction", "Books"),
    ("Children's", "Books"),
    ("Sports", None),
    ("Outdoor", "Sports"),
    ("Fitness", "Sports"),
    ("Team Sports", "Sports"),
]
assert len(category_names) == 20

cat_id_map = {}
categories_sql = []

for name, parent in category_names:
    parent_id = (
        "NULL"
        if parent is None
        else f"(SELECT category_id FROM categories WHERE name = '{parent}')"
    )
    categories_sql.append(
        f"INSERT INTO categories (name, description, parent_category_id) VALUES "
        f"('{esc(name)}', '{esc(fake.text(max_nb_chars=100))}', {parent_id});"
    )

suppliers_sql = []
for _ in range(NUM_SUPPLIERS):
    suppliers_sql.append(
        f"INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES "
        f"('{esc(fake.company())}', '{esc(fake.name())}', '{fake.phone_number()}', "
        f"'{fake.email()}', '{esc(fake.address())}');"
    )

warehouses_sql = []
for _ in range(NUM_WAREHOUSES):
    warehouses_sql.append(
        f"INSERT INTO warehouses (name, address, city, state, zip_code) VALUES "
        f"('{esc(fake.company())} DC', '{esc(fake.street_address())}', '{fake.city()}', "
        f"'{fake.state_abbr()}', '{fake.zipcode()}');"
    )

customers_sql = []
for _ in range(NUM_CUSTOMERS):
    customers_sql.append(
        f"INSERT INTO customers (first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES "
        f"('{esc(fake.first_name())}', '{esc(fake.last_name())}', '{fake.email()}', "
        f"'{fake.phone_number()}', '{esc(fake.street_address())}', '{fake.city()}', "
        f"'{fake.state_abbr()}', '{fake.zipcode()}');"
    )

coupon_codes = [
    "SAVE10",
    "WELCOME20",
    "FLASH15",
    "SUMMER5",
    "WINTER10",
    "FREESHIP",
    "VIP25",
    "BOGO",
    "DEAL40",
    "SAVE5",
    "HOLIDAY",
    "WEEKEND",
    "EARLYBIRD",
    "LASTCHANCE",
    "MEGA10",
]
coupons_sql = []
for i in range(NUM_COUPONS):
    valid_from = fake.date_between(start_date="-90d", end_date="-30d")
    valid_to = valid_from + timedelta(days=random.randint(20, 60))
    disc_type = random.choice(["Percentage", "Fixed"])
    disc_value = (
        round(random.uniform(5, 30), 2)
        if disc_type == "Percentage"
        else round(random.uniform(5, 25), 2)
    )
    coupons_sql.append(
        f"INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES "
        f"('{coupon_codes[i]}', '{esc(fake.sentence())}', '{disc_type}', {disc_value}, "
        f"'{valid_from}', '{valid_to}', {random.randint(20, 100)});"
    )

product_names = {
    "Electronics": [
        "Wireless Headphones",
        "Bluetooth Speaker",
        "4K Monitor",
        "External SSD",
        "Gaming Mouse",
        "Mechanical Keyboard",
        "Webcam",
        "USB Hub",
        "Power Bank",
        "Smart Watch",
        "Drone",
        "Action Camera",
    ],
    "Smartphones": [
        "iPhone 15 Pro",
        "Samsung Galaxy S24",
        "Google Pixel 8",
        "OnePlus 12",
        "Xiaomi 14",
        "Nothing Phone 2",
        "Sony Xperia",
        "Motorola Edge",
        "Asus Zenfone",
        "Realme GT",
    ],
    "Laptops": [
        "MacBook Pro 16",
        "Dell XPS 15",
        "HP Spectre",
        "Lenovo ThinkPad",
        "Asus ROG",
        "Acer Swift",
        "MSI Stealth",
        "Surface Laptop",
        "Razer Blade",
        "Gigabyte Aero",
    ],
    "Audio": [
        "Noise Cancelling Earbuds",
        "Over-Ear Headphones",
        "Soundbar",
        "Portable Speaker",
        "Studio Monitors",
        "Amplifier",
        "Turntable",
        "Digital Audio Player",
    ],
    "Clothing": [
        "Classic T-Shirt",
        "Hoodie",
        "Jeans",
        "Chinos",
        "Polo Shirt",
        "Jacket",
        "Sweater",
        "Shorts",
    ],
    "Men's Apparel": [
        "Slim Fit Suit",
        "Casual Blazer",
        "Dress Shirt",
        "Tie Set",
        "Cargo Pants",
        "Henley",
    ],
    "Women's Apparel": [
        "Floral Dress",
        "Blouse",
        "Skirt",
        "Leggings",
        "Cardigan",
        "Trench Coat",
        "Jumpsuit",
    ],
    "Footwear": [
        "Running Shoes",
        "Leather Boots",
        "Sneakers",
        "Loafers",
        "Sandals",
        "High Heels",
        "Trainers",
    ],
    "Home & Kitchen": [
        "Coffee Maker",
        "Blender",
        "Air Fryer",
        "Toaster",
        "Mixer",
        "Rice Cooker",
        "Juicer",
    ],
    "Furniture": [
        "L-Shaped Sofa",
        "Dining Table",
        "Office Chair",
        "Bookshelf",
        "Bed Frame",
        "Nightstand",
    ],
    "Cookware": [
        "Non-Stick Pan",
        "Stainless Pot",
        "Knife Set",
        "Cutting Board",
        "Baking Tray",
        "Cast Iron Skillet",
    ],
    "Decor": [
        "Wall Art",
        "Vase",
        "Throw Pillow",
        "Rug",
        "Candle Set",
        "Photo Frame",
        "Mirror",
    ],
    "Books": [
        "Dune",
        "The Alchemist",
        "Sapiens",
        "1984",
        "Harry Potter",
        "The Hobbit",
        "To Kill a Mockingbird",
    ],
    "Fiction": [
        "The Great Gatsby",
        "Catcher in the Rye",
        "Brave New World",
        "Fahrenheit 451",
        "Catch-22",
    ],
    "Non-Fiction": [
        "Atomic Habits",
        "Deep Work",
        "Thinking Fast Slow",
        "Educated",
        "The Power of Habit",
    ],
    "Children's": [
        "The Very Hungry Caterpillar",
        "Goodnight Moon",
        "Where the Wild Things Are",
        "Matilda",
    ],
    "Sports": [
        "Basketball",
        "Soccer Ball",
        "Tennis Racket",
        "Baseball Bat",
        "Golf Club Set",
    ],
    "Outdoor": [
        "Camping Tent",
        "Sleeping Bag",
        "Hiking Backpack",
        "Climbing Rope",
        "Headlamp",
    ],
    "Fitness": [
        "Yoga Mat",
        "Dumbbell Set",
        "Resistance Bands",
        "Jump Rope",
        "Kettlebell",
    ],
    "Team Sports": [
        "Volleyball",
        "Football Helmet",
        "Hockey Stick",
        "Cricket Bat",
        "Rugby Ball",
    ],
}

cat_names = [c[0] for c in category_names]
cat_id_map_gen = {name: idx + 1 for idx, name in enumerate(cat_names)}

all_cat_names = list(product_names.keys())
valid_cat_names = [c for c in all_cat_names if c in cat_id_map_gen]

products_sql = []
product_ids = list(range(1, NUM_PRODUCTS + 1))

for pid in range(1, NUM_PRODUCTS + 1):
    cat_name = random.choice(valid_cat_names)
    cat_id = cat_id_map_gen[cat_name]
    name = random.choice(product_names[cat_name]) + " " + str(random.randint(1, 100))
    price = round(random.uniform(15.99, 999.99), 2)
    cost = round(price * random.uniform(0.4, 0.85), 2)
    supplier_id = random.randint(1, NUM_SUPPLIERS)
    products_sql.append(
        f"INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES "
        f"({pid}, '{esc(name)}', '{esc(fake.text(max_nb_chars=200))}', {price}, {cost}, {cat_id}, {supplier_id});"
    )

orders_sql = []
order_statuses = ["Pending", "Paid", "Shipped", "Delivered", "Cancelled"]
status_weights = [5, 15, 20, 55, 5]  # 55% Delivered, 20% Shipped, 15% Paid, etc.
order_dates = []

for order_id in range(1, NUM_ORDERS + 1):
    customer_id = random.randint(1, NUM_CUSTOMERS)
    coupon_id = random.choice([None] + list(range(1, NUM_COUPONS + 1)))
    if coupon_id is None:
        coupon_val = "NULL"
    else:
        coupon_val = str(coupon_id)
    status = random.choices(order_statuses, weights=status_weights)[0]
    order_date = fake.date_time_between(start_date="-180d", end_date="now")
    order_dates.append(order_date)
    orders_sql.append(
        f"INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES "
        f"({order_id}, {customer_id}, {coupon_val}, '{order_date.strftime('%Y-%m-%d %H:%M:%S')}', '{status}', 0);"
    )

order_items_sql = []
order_totals = [0.0] * (NUM_ORDERS + 1)  # 1-indexed

for order_id in range(1, NUM_ORDERS + 1):
    num_items = random.choices([1, 2, 3, 4, 5], weights=[10, 25, 30, 20, 15])[0]
    for _ in range(num_items):
        product_id = random.randint(1, NUM_PRODUCTS)
        quantity = random.randint(1, 3)
        pass

print("Building data structures...")

categories_data = []
suppliers_data = []
warehouses_data = []
customers_data = []
coupons_data = []
products_data = []
orders_data = []
order_items_data = []
payments_data = []
shipments_data = []
inventory_data = []
reviews_data = []

for name, parent in category_names:
    categories_data.append(
        {"name": name, "description": fake.text(max_nb_chars=100), "parent": parent}
    )
cat_name_to_id = {c["name"]: idx + 1 for idx, c in enumerate(categories_data)}

for _ in range(NUM_SUPPLIERS):
    suppliers_data.append(
        {
            "name": fake.company(),
            "contact": fake.name(),
            "phone": fake.phone_number(),
            "email": fake.email(),
            "address": fake.address(),
        }
    )

for _ in range(NUM_WAREHOUSES):
    warehouses_data.append(
        {
            "name": fake.company() + " DC",
            "address": fake.street_address(),
            "city": fake.city(),
            "state": fake.state_abbr(),
            "zip": fake.zipcode(),
        }
    )

for _ in range(NUM_CUSTOMERS):
    customers_data.append(
        {
            "first": fake.first_name(),
            "last": fake.last_name(),
            "email": fake.email(),
            "phone": fake.phone_number(),
            "address": fake.street_address(),
            "city": fake.city(),
            "state": fake.state_abbr(),
            "zip": fake.zipcode(),
        }
    )

for i in range(NUM_COUPONS):
    valid_from = fake.date_between(start_date="-90d", end_date="-30d")
    valid_to = valid_from + timedelta(days=random.randint(20, 60))
    disc_type = random.choice(["Percentage", "Fixed"])
    disc_value = (
        round(random.uniform(5, 30), 2)
        if disc_type == "Percentage"
        else round(random.uniform(5, 25), 2)
    )
    coupons_data.append(
        {
            "code": coupon_codes[i],
            "desc": fake.sentence(),
            "disc_type": disc_type,
            "disc_value": disc_value,
            "valid_from": valid_from,
            "valid_to": valid_to,
            "usage_limit": random.randint(20, 100),
        }
    )

product_prices = {}
for pid in range(1, NUM_PRODUCTS + 1):
    cat_name = random.choice(valid_cat_names)
    cat_id = cat_name_to_id[cat_name]
    name = random.choice(product_names[cat_name]) + " " + str(random.randint(1, 100))
    price = round(random.uniform(15.99, 999.99), 2)
    cost = round(price * random.uniform(0.4, 0.85), 2)
    supplier_id = random.randint(1, NUM_SUPPLIERS)
    products_data.append(
        {
            "product_id": pid,
            "name": name,
            "desc": fake.text(max_nb_chars=200),
            "price": price,
            "cost": cost,
            "category_id": cat_id,
            "supplier_id": supplier_id,
        }
    )
    product_prices[pid] = price

for order_id in range(1, NUM_ORDERS + 1):
    customer_id = random.randint(1, NUM_CUSTOMERS)
    coupon_id = random.choice([None] + list(range(1, NUM_COUPONS + 1)))
    status = random.choices(order_statuses, weights=status_weights)[0]
    order_date = fake.date_time_between(start_date="-180d", end_date="now")
    orders_data.append(
        {
            "order_id": order_id,
            "customer_id": customer_id,
            "coupon_id": coupon_id,
            "order_date": order_date,
            "status": status,
            "total_amount": 0.0,
        }
    )

for order_id in range(1, NUM_ORDERS + 1):
    num_items = random.choices([1, 2, 3, 4, 5], weights=[10, 25, 30, 20, 15])[0]
    total = 0.0
    for _ in range(num_items):
        product_id = random.randint(1, NUM_PRODUCTS)
        qty = random.randint(1, 3)
        unit_price = product_prices[product_id]
        discount = round(random.uniform(0, 0.15), 2)
        total += qty * unit_price * (1 - discount)
        order_items_data.append(
            {
                "order_id": order_id,
                "product_id": product_id,
                "quantity": qty,
                "unit_price": unit_price,
                "discount": discount,
            }
        )
    coupon_id = orders_data[order_id - 1]["coupon_id"]
    if coupon_id is not None:
        coup = coupons_data[coupon_id - 1]
        if coup["disc_type"] == "Percentage":
            total *= 1 - coup["disc_value"] / 100.0
        else:
            total = max(0, total - coup["disc_value"])
    total = round(total, 2)
    orders_data[order_id - 1]["total_amount"] = total

for order_id in range(1, NUM_ORDERS + 1):
    order_status = orders_data[order_id - 1]["status"]
    if order_status == "Cancelled":
        pay_status = "Failed"
    elif order_status in ["Pending"]:
        pay_status = "Pending"
    else:
        pay_status = "Completed"
    amount = orders_data[order_id - 1]["total_amount"]
    method = random.choice(["Credit Card", "PayPal", "Bank Transfer", "Gift Card"])
    payments_data.append(
        {
            "order_id": order_id,
            "amount": amount,
            "method": method,
            "status": pay_status,
            "payment_date": orders_data[order_id - 1]["order_date"]
            + timedelta(hours=random.randint(1, 48)),
        }
    )

for order_id in range(1, NUM_ORDERS + 1):
    order_status = orders_data[order_id - 1]["status"]
    if order_status in ["Shipped", "Delivered"]:
        warehouse_id = random.randint(1, NUM_WAREHOUSES)
        carrier = random.choice(["UPS", "FedEx", "DHL", "USPS", "Amazon Logistics"])
        tracking = fake.uuid4()[:8].upper()
        shipped_date = orders_data[order_id - 1]["order_date"] + timedelta(
            days=random.randint(1, 5)
        )
        if order_status == "Delivered":
            delivered_date = shipped_date + timedelta(days=random.randint(1, 7))
        else:
            delivered_date = None
        shipments_data.append(
            {
                "order_id": order_id,
                "warehouse_id": warehouse_id,
                "carrier": carrier,
                "tracking": tracking,
                "shipped_date": shipped_date,
                "delivered_date": delivered_date,
            }
        )
    else:
        # No shipment for others
        pass

for pid in range(1, NUM_PRODUCTS + 1):
    for wid in range(1, NUM_WAREHOUSES + 1):
        qty = random.randint(0, 500)
        reorder = random.randint(5, 25)
        inventory_data.append(
            {
                "product_id": pid,
                "warehouse_id": wid,
                "quantity": qty,
                "reorder": reorder,
            }
        )

reviewed_products = random.choices(range(1, NUM_PRODUCTS + 1), k=NUM_REVIEWS)
for pid in reviewed_products:
    customer_id = random.randint(1, NUM_CUSTOMERS)
    rating = random.choices([1, 2, 3, 4, 5], weights=[5, 10, 25, 40, 20])[0]
    comment = fake.text(max_nb_chars=300) if random.random() > 0.3 else None
    review_date = fake.date_time_between(start_date="-150d", end_date="now")
    reviews_data.append(
        {
            "product_id": pid,
            "customer_id": customer_id,
            "rating": rating,
            "comment": comment,
            "review_date": review_date,
        }
    )
seen = set()
unique_reviews = []
for r in reviews_data:
    key = (r["product_id"], r["customer_id"])
    if key not in seen:
        seen.add(key)
        unique_reviews.append(r)
reviews_data = unique_reviews

print("Generating SQL...")

sql_lines = []
sql_lines.append("BEGIN TRANSACTION;")
sql_lines.append("")

sql_lines.append("-- Categories")
for c in categories_data:
    parent = (
        "NULL"
        if c["parent"] is None
        else f"(SELECT category_id FROM categories WHERE name = '{esc(c['parent'])}')"
    )
    sql_lines.append(
        f"INSERT INTO categories (name, description, parent_category_id) VALUES "
        f"('{esc(c['name'])}', '{esc(c['description'])}', {parent});"
    )
sql_lines.append("")

sql_lines.append("-- Suppliers")
for s in suppliers_data:
    sql_lines.append(
        f"INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES "
        f"('{esc(s['name'])}', '{esc(s['contact'])}', '{s['phone']}', '{s['email']}', '{esc(s['address'])}');"
    )
sql_lines.append("")

sql_lines.append("-- Warehouses")
for w in warehouses_data:
    sql_lines.append(
        f"INSERT INTO warehouses (name, address, city, state, zip_code) VALUES "
        f"('{esc(w['name'])}', '{esc(w['address'])}', '{w['city']}', '{w['state']}', '{w['zip']}');"
    )
sql_lines.append("")

sql_lines.append("-- Customers")
for c in customers_data:
    sql_lines.append(
        f"INSERT INTO customers (first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES "
        f"('{esc(c['first'])}', '{esc(c['last'])}', '{c['email']}', '{c['phone']}', "
        f"'{esc(c['address'])}', '{c['city']}', '{c['state']}', '{c['zip']}');"
    )
sql_lines.append("")

sql_lines.append("-- Coupons")
for cp in coupons_data:
    sql_lines.append(
        f"INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES "
        f"('{cp['code']}', '{esc(cp['desc'])}', '{cp['disc_type']}', {cp['disc_value']}, "
        f"'{cp['valid_from']}', '{cp['valid_to']}', {cp['usage_limit']});"
    )
sql_lines.append("")

sql_lines.append("-- Products")
for p in products_data:
    sql_lines.append(
        f"INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES "
        f"({p['product_id']}, '{esc(p['name'])}', '{esc(p['desc'])}', {p['price']}, {p['cost']}, "
        f"{p['category_id']}, {p['supplier_id']});"
    )
sql_lines.append("")

sql_lines.append("-- Orders")
for o in orders_data:
    coupon = "NULL" if o["coupon_id"] is None else str(o["coupon_id"])
    sql_lines.append(
        f"INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES "
        f"({o['order_id']}, {o['customer_id']}, {coupon}, "
        f"'{o['order_date'].strftime('%Y-%m-%d %H:%M:%S')}', '{o['status']}', {o['total_amount']});"
    )
sql_lines.append("")

sql_lines.append("-- Order Items")
for oi in order_items_data:
    sql_lines.append(
        f"INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES "
        f"({oi['order_id']}, {oi['product_id']}, {oi['quantity']}, {oi['unit_price']}, {oi['discount']});"
    )
sql_lines.append("")

sql_lines.append("-- Payments")
for pay in payments_data:
    sql_lines.append(
        f"INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES "
        f"({pay['order_id']}, {pay['amount']}, '{pay['method']}', '{pay['status']}', "
        f"'{pay['payment_date'].strftime('%Y-%m-%d %H:%M:%S')}');"
    )
sql_lines.append("")

sql_lines.append("-- Shipments")
for sh in shipments_data:
    delivered = (
        "NULL"
        if sh["delivered_date"] is None
        else f"'{sh['delivered_date'].strftime('%Y-%m-%d %H:%M:%S')}'"
    )
    sql_lines.append(
        f"INSERT INTO shipments (order_id, warehouse_id, carrier, tracking_number, shipped_date, delivered_date) VALUES "
        f"({sh['order_id']}, {sh['warehouse_id']}, '{sh['carrier']}', '{sh['tracking']}', "
        f"'{sh['shipped_date'].strftime('%Y-%m-%d %H:%M:%S')}', {delivered});"
    )
sql_lines.append("")

sql_lines.append("-- Inventory")
for inv in inventory_data:
    sql_lines.append(
        f"INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES "
        f"({inv['product_id']}, {inv['warehouse_id']}, {inv['quantity']}, {inv['reorder']});"
    )
sql_lines.append("")

sql_lines.append("-- Reviews")
for rv in reviews_data:
    comment = "NULL" if rv["comment"] is None else f"'{esc(rv['comment'])}'"
    sql_lines.append(
        f"INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES "
        f"({rv['product_id']}, {rv['customer_id']}, {rv['rating']}, {comment}, "
        f"'{rv['review_date'].strftime('%Y-%m-%d %H:%M:%S')}');"
    )
sql_lines.append("")

sql_lines.append("COMMIT;")

with open("insert_data.sql", "w") as f:
    f.write("\n".join(sql_lines))

print(f"SQL file generated: insert_data.sql")
print(f"Total rows generated:")
print(f"  Categories: {len(categories_data)}")
print(f"  Suppliers: {len(suppliers_data)}")
print(f"  Warehouses: {len(warehouses_data)}")
print(f"  Customers: {len(customers_data)}")
print(f"  Coupons: {len(coupons_data)}")
print(f"  Products: {len(products_data)}")
print(f"  Orders: {len(orders_data)}")
print(f"  Order Items: {len(order_items_data)}")
print(f"  Payments: {len(payments_data)}")
print(f"  Shipments: {len(shipments_data)}")
print(f"  Inventory: {len(inventory_data)}")
print(f"  Reviews: {len(reviews_data)}")
print(
    f"TOTAL: {sum([len(categories_data), len(suppliers_data), len(warehouses_data), len(customers_data), len(coupons_data), len(products_data), len(orders_data), len(order_items_data), len(payments_data), len(shipments_data), len(inventory_data), len(reviews_data)])}"
)

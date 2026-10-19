#!/usr/bin/env python3

import os
import random
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

SHARD1_CUST_COUNT = 75
SHARD1_ORDER_COUNT = 100


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
        "Studio Monitors",
        "Turntable",
        "Soundbar",
        "DAC Amplifier",
        "Microphone",
        "Audio Interface",
        "Earbuds",
    ],
    "Clothing": [
        "Denim Jacket",
        "Cotton T-Shirt",
        "Chino Pants",
        "Wool Sweater",
        "Raincoat",
    ],
    "Men's Apparel": [
        "Oxford Shirt",
        "Cargo Shorts",
        "Polo Shirt",
        "Slim Jeans",
        "Blazer",
        "Thermal Underwear",
    ],
    "Women's Apparel": [
        "Summer Dress",
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

print("Building data structures...")

# 1. Categories
categories_data = []
for name, parent in category_names:
    categories_data.append(
        {"name": name, "description": fake.text(max_nb_chars=100), "parent": parent}
    )
cat_name_to_id = {c["name"]: idx + 1 for idx, c in enumerate(categories_data)}
valid_cat_names = [c for c in product_names.keys() if c in cat_name_to_id]

# 2. Suppliers
suppliers_data = []
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

# 3. Warehouses
warehouses_data = []
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

# 4. Customers: Shard 1 (ID 1..75), Shard 2 (ID 1001..1075)
customers_data = []
for idx in range(NUM_CUSTOMERS):
    if idx < SHARD1_CUST_COUNT:
        cid = idx + 1
    else:
        cid = 1001 + (idx - SHARD1_CUST_COUNT)
    customers_data.append(
        {
            "customer_id": cid,
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

# 5. Coupons
coupons_data = []
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

# 6. Products
products_data = []
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

# 7. Orders: Shard 1 (ID 1..100 with customers 1..75), Shard 2 (ID 1001..1100 with customers 1001..1075)
orders_data = []
order_statuses = ["Pending", "Paid", "Shipped", "Delivered", "Cancelled"]
status_weights = [5, 15, 20, 55, 5]

for idx in range(NUM_ORDERS):
    if idx < SHARD1_ORDER_COUNT:
        order_id = idx + 1
        customer_id = random.randint(1, 75)
    else:
        order_id = 1001 + (idx - SHARD1_ORDER_COUNT)
        customer_id = random.randint(1001, 1075)

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

# 8. Order Items
order_items_data = []
for order in orders_data:
    order_id = order["order_id"]
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
    coupon_id = order["coupon_id"]
    if coupon_id is not None:
        coup = coupons_data[coupon_id - 1]
        if coup["disc_type"] == "Percentage":
            total *= 1 - coup["disc_value"] / 100.0
        else:
            total = max(0, total - coup["disc_value"])
    total = round(total, 2)
    order["total_amount"] = total

# 9. Payments
payments_data = []
for order in orders_data:
    order_id = order["order_id"]
    order_status = order["status"]
    if order_status == "Cancelled":
        pay_status = "Failed"
    elif order_status in ["Pending"]:
        pay_status = "Pending"
    else:
        pay_status = "Completed"
    amount = order["total_amount"]
    method = random.choice(["Credit Card", "PayPal", "Bank Transfer", "Gift Card"])
    payments_data.append(
        {
            "order_id": order_id,
            "amount": amount,
            "method": method,
            "status": pay_status,
            "payment_date": order["order_date"] + timedelta(hours=random.randint(1, 48)),
        }
    )

# 10. Shipments
shipments_data = []
for order in orders_data:
    order_id = order["order_id"]
    order_status = order["status"]
    if order_status in ["Shipped", "Delivered"]:
        warehouse_id = random.randint(1, NUM_WAREHOUSES)
        carrier = random.choice(["UPS", "FedEx", "DHL", "USPS", "Amazon Logistics"])
        tracking = fake.uuid4()[:8].upper()
        shipped_date = order["order_date"] + timedelta(days=random.randint(1, 5))
        delivered_date = (
            shipped_date + timedelta(days=random.randint(1, 7))
            if order_status == "Delivered"
            else None
        )
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

# 11. Inventory
inventory_data = []
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

# 12. Reviews
reviews_data = []
reviewed_products = random.choices(range(1, NUM_PRODUCTS + 1), k=NUM_REVIEWS)
for idx, pid in enumerate(reviewed_products):
    if idx < NUM_REVIEWS // 2:
        customer_id = random.randint(1, 75)
    else:
        customer_id = random.randint(1001, 1075)
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


def build_sql(shard):
    """Build SQL statements for a specific shard (1 or 2)."""
    sql_lines = []
    sql_lines.append("BEGIN TRANSACTION;")
    sql_lines.append("")

    # Categories (Replicated)
    sql_lines.append("-- Categories (Replicated)")
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

    # Suppliers (Replicated)
    sql_lines.append("-- Suppliers (Replicated)")
    for s in suppliers_data:
        sql_lines.append(
            f"INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES "
            f"('{esc(s['name'])}', '{esc(s['contact'])}', '{s['phone']}', '{s['email']}', '{esc(s['address'])}');"
        )
    sql_lines.append("")

    # Warehouses (Replicated)
    sql_lines.append("-- Warehouses (Replicated)")
    for w in warehouses_data:
        sql_lines.append(
            f"INSERT INTO warehouses (name, address, city, state, zip_code) VALUES "
            f"('{esc(w['name'])}', '{esc(w['address'])}', '{w['city']}', '{w['state']}', '{w['zip']}');"
        )
    sql_lines.append("")

    # Coupons (Replicated)
    sql_lines.append("-- Coupons (Replicated)")
    for cp in coupons_data:
        sql_lines.append(
            f"INSERT INTO coupons (code, description, discount_type, discount_value, valid_from, valid_to, usage_limit) VALUES "
            f"('{cp['code']}', '{esc(cp['desc'])}', '{cp['disc_type']}', {cp['disc_value']}, "
            f"'{cp['valid_from']}', '{cp['valid_to']}', {cp['usage_limit']});"
        )
    sql_lines.append("")

    # Products (Replicated)
    sql_lines.append("-- Products (Replicated)")
    for p in products_data:
        sql_lines.append(
            f"INSERT INTO products (product_id, name, description, price, cost, category_id, supplier_id) VALUES "
            f"({p['product_id']}, '{esc(p['name'])}', '{esc(p['desc'])}', {p['price']}, {p['cost']}, "
            f"{p['category_id']}, {p['supplier_id']});"
        )
    sql_lines.append("")

    # Inventory (Replicated)
    sql_lines.append("-- Inventory (Replicated)")
    for inv in inventory_data:
        sql_lines.append(
            f"INSERT INTO inventory (product_id, warehouse_id, quantity_on_hand, reorder_level) VALUES "
            f"({inv['product_id']}, {inv['warehouse_id']}, {inv['quantity']}, {inv['reorder']});"
        )
    sql_lines.append("")

    # Sharded Entities
    if shard == 1:
        target_customers = [c for c in customers_data if c["customer_id"] <= 1000]
        target_orders = [o for o in orders_data if o["order_id"] <= 1000]
        target_reviews = [r for r in reviews_data if r["customer_id"] <= 1000]
    else:
        target_customers = [c for c in customers_data if c["customer_id"] > 1000]
        target_orders = [o for o in orders_data if o["order_id"] > 1000]
        target_reviews = [r for r in reviews_data if r["customer_id"] > 1000]

    target_order_ids = set(o["order_id"] for o in target_orders)
    target_order_items = [oi for oi in order_items_data if oi["order_id"] in target_order_ids]
    target_payments = [p for p in payments_data if p["order_id"] in target_order_ids]
    target_shipments = [s for s in shipments_data if s["order_id"] in target_order_ids]

    # Customers
    sql_lines.append(f"-- Customers (Shard {shard})")
    for c in target_customers:
        sql_lines.append(
            f"INSERT INTO customers (customer_id, first_name, last_name, email, phone, address_line, city, state, zip_code) VALUES "
            f"({c['customer_id']}, '{esc(c['first'])}', '{esc(c['last'])}', '{c['email']}', '{c['phone']}', "
            f"'{esc(c['address'])}', '{c['city']}', '{c['state']}', '{c['zip']}');"
        )
    sql_lines.append("")

    # Orders
    sql_lines.append(f"-- Orders (Shard {shard})")
    for o in target_orders:
        coupon = "NULL" if o["coupon_id"] is None else str(o["coupon_id"])
        sql_lines.append(
            f"INSERT INTO orders (order_id, customer_id, coupon_id, order_date, status, total_amount) VALUES "
            f"({o['order_id']}, {o['customer_id']}, {coupon}, "
            f"'{o['order_date'].strftime('%Y-%m-%d %H:%M:%S')}', '{o['status']}', {o['total_amount']});"
        )
    sql_lines.append("")

    # Order Items
    sql_lines.append(f"-- Order Items (Shard {shard})")
    for oi in target_order_items:
        sql_lines.append(
            f"INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES "
            f"({oi['order_id']}, {oi['product_id']}, {oi['quantity']}, {oi['unit_price']}, {oi['discount']});"
        )
    sql_lines.append("")

    # Payments
    sql_lines.append(f"-- Payments (Shard {shard})")
    for pay in target_payments:
        sql_lines.append(
            f"INSERT INTO payments (order_id, amount, method, status, payment_date) VALUES "
            f"({pay['order_id']}, {pay['amount']}, '{pay['method']}', '{pay['status']}', "
            f"'{pay['payment_date'].strftime('%Y-%m-%d %H:%M:%S')}');"
        )
    sql_lines.append("")

    # Shipments
    sql_lines.append(f"-- Shipments (Shard {shard})")
    for sh in target_shipments:
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

    # Reviews
    sql_lines.append(f"-- Reviews (Shard {shard})")
    for rv in target_reviews:
        comment = "NULL" if rv["comment"] is None else f"'{esc(rv['comment'])}'"
        sql_lines.append(
            f"INSERT INTO reviews (product_id, customer_id, rating, comment, review_date) VALUES "
            f"({rv['product_id']}, {rv['customer_id']}, {rv['rating']}, {comment}, "
            f"'{rv['review_date'].strftime('%Y-%m-%d %H:%M:%S')}');"
        )
    sql_lines.append("")
    sql_lines.append("COMMIT;")

    return "\n".join(sql_lines), {
        "categories": len(categories_data),
        "suppliers": len(suppliers_data),
        "warehouses": len(warehouses_data),
        "coupons": len(coupons_data),
        "products": len(products_data),
        "inventory": len(inventory_data),
        "customers": len(target_customers),
        "orders": len(target_orders),
        "order_items": len(target_order_items),
        "payments": len(target_payments),
        "shipments": len(target_shipments),
        "reviews": len(target_reviews),
    }


script_dir = os.path.dirname(os.path.abspath(__file__))

# Generate Shard 1 dataset
sql_s1, counts_s1 = build_sql(shard=1)
with open(os.path.join(script_dir, "insert_data_shard1.sql"), "w") as f:
    f.write(sql_s1)

# Generate Shard 2 dataset
sql_s2, counts_s2 = build_sql(shard=2)
with open(os.path.join(script_dir, "insert_data_shard2.sql"), "w") as f:
    f.write(sql_s2)

print("Generated SQL files successfully in:", script_dir)
print(f"Shard 1: Customers {counts_s1['customers']} (1..75), Orders {counts_s1['orders']} (1..100)")
print(f"Shard 2: Customers {counts_s2['customers']} (1001..1075), Orders {counts_s2['orders']} (1001..1100)")

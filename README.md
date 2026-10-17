## How to Run

1. Run Compose: ```docker compose up```

## Database Schema

### Customers

| Column | Type | Constraints |
|--------|------|-------------|
| customer_id | SERIAL | PRIMARY KEY |
| first_name | VARCHAR(50) | NOT NULL |
| last_name | VARCHAR(50) | NOT NULL |
| email | VARCHAR(100) | UNIQUE, NOT NULL |
| phone | VARCHAR(30) | |
| address_line | VARCHAR(255) | |
| city | VARCHAR(50) | |
| state | VARCHAR(50) | |
| zip_code | VARCHAR(20) | |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

### Categories

| Column | Type | Constraints |
|--------|------|-------------|
| category_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| description | TEXT | |
| parent_category_id | INT | FK → Categories(category_id) |

### Suppliers

| Column | Type | Constraints |
|--------|------|-------------|
| supplier_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| contact_name | VARCHAR(100) | |
| phone | VARCHAR(20) | |
| email | VARCHAR(100) | |
| address | TEXT | |

### Products

| Column | Type | Constraints |
|--------|------|-------------|
| product_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(200) | NOT NULL |
| description | TEXT | |
| price | DECIMAL(10,2) | NOT NULL, CHECK (price >= 0) |
| cost | DECIMAL(10,2) | CHECK (cost >= 0) |
| category_id | INT | FK → Categories(category_id) |
| supplier_id | INT | FK → Suppliers(supplier_id) |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |

### Warehouses

| Column | Type | Constraints |
|--------|------|-------------|
| warehouse_id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL |
| address | TEXT | |
| city | VARCHAR(50) | |
| state | VARCHAR(50) | |
| zip_code | VARCHAR(20) | |

### Inventory

| Column | Type | Constraints |
|--------|------|-------------|
| product_id | INT | PK, FK → Products(product_id) ON DELETE CASCADE |
| warehouse_id | INT | PK, FK → Warehouses(warehouse_id) ON DELETE CASCADE |
| quantity_on_hand | INT | NOT NULL, DEFAULT 0 |
| reorder_level | INT | DEFAULT 10 |

### Coupons

| Column | Type | Constraints |
|--------|------|-------------|
| coupon_id | SERIAL | PRIMARY KEY |
| code | VARCHAR(50) | UNIQUE, NOT NULL |
| description | VARCHAR(255) | |
| discount_type | VARCHAR(20) | NOT NULL, CHECK IN ('Percentage', 'Fixed') |
| discount_value | DECIMAL(10,2) | NOT NULL, CHECK (discount_value >= 0) |
| valid_from | DATE | NOT NULL |
| valid_to | DATE | NOT NULL |
| usage_limit | INT | |

### Orders

| Column | Type | Constraints |
|--------|------|-------------|
| order_id | SERIAL | PRIMARY KEY |
| customer_id | INT | FK → Customers(customer_id), NOT NULL |
| coupon_id | INT | FK → Coupons(coupon_id), NULL |
| order_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('Pending', 'Paid', 'Shipped', 'Delivered', 'Cancelled') |
| total_amount | DECIMAL(10,2) | NOT NULL, CHECK (total_amount >= 0) |

### Order_Items

| Column | Type | Constraints |
|--------|------|-------------|
| order_item_id | SERIAL | PRIMARY KEY |
| order_id | INT | PK, FK → Orders(order_id) ON DELETE CASCADE, NOT NULL |
| product_id | INT | FK → Products(product_id), NOT NULL |
| quantity | INT | NOT NULL, CHECK (quantity > 0) |
| unit_price | DECIMAL(10,2) | NOT NULL, CHECK (unit_price >= 0) |
| discount | DECIMAL(5,2) | DEFAULT 0.00, CHECK (discount >= 0) |

### Payments

| Column | Type | Constraints |
|--------|------|-------------|
| payment_id | SERIAL | PRIMARY KEY |
| order_id | INT | UNIQUE, FK → Orders(order_id), NOT NULL |
| payment_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| amount | DECIMAL(10,2) | NOT NULL, CHECK (amount >= 0) |
| method | VARCHAR(20) | NOT NULL, CHECK IN ('Credit Card', 'PayPal', 'Bank Transfer', 'Gift Card') |
| status | VARCHAR(20) | NOT NULL, CHECK IN ('Pending', 'Completed', 'Failed') |

### Shipments

| Column | Type | Constraints |
|--------|------|-------------|
| shipment_id | SERIAL | PRIMARY KEY |
| order_id | INT | UNIQUE, FK → Orders(order_id), NOT NULL |
| warehouse_id | INT | FK → Warehouses(warehouse_id), NOT NULL |
| carrier | VARCHAR(50) | |
| tracking_number | VARCHAR(100) | |
| shipped_date | TIMESTAMP | |
| delivered_date | TIMESTAMP | CHECK (delivered_date IS NULL OR shipped_date IS NOT NULL) |

### Reviews

| Column | Type | Constraints |
|--------|------|-------------|
| review_id | SERIAL | PRIMARY KEY |
| product_id | INT | FK → Products(product_id) ON DELETE CASCADE, NOT NULL |
| customer_id | INT | FK → Customers(customer_id) ON DELETE CASCADE, NOT NULL |
| rating | INT | NOT NULL, CHECK (rating BETWEEN 1 AND 5) |
| comment | TEXT | |
| review_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP |
| | | UNIQUE (product_id, customer_id) |

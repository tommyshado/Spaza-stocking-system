create table areas (
    area_id SERIAL PRIMARY KEY,
    area_name VARCHAR(255) NOT NULL
);

-- create a dropdown to show the areas and each area give it a value to insert into the area_id foreign key
create table spaza_shops (
    spaza_shop_id SERIAL PRIMARY KEY,
    spaza_shop_name VARCHAR(255) NOT NULL,

    -- foreign key
    area_id INT NOT NULL,
    FOREIGN KEY (area_id) REFERENCES area(area_id)
);

create table food_items (
    food_item_id SERIAL PRIMARY KEY,
    food_item_name VARCHAR(255) NOT NULL,
    food_item_price NUMERIC NOT NULL
);

-- if spaza shops buys 5 items of the same kind
    -- they get 20% discount off all the products

-- if they buy 7 or > 7 items of the same kind
    -- they will get 25% discount off all the products
    -- also get discounts if spaza shops are from the same area

-- stores 20%, 25% and 50% discounts populated
create table discounts (
    discount_id SERIAL PRIMARY KEY,
    discount_percentage NUMERIC NOT NULL
);

create table stockings (
    checkout_id SERIAL PRIMARY KEY,
    stockings_total NUMERIC NOT NULL,
    stocking_date DATE,
    stocking_time TIME,

    -- foreign keys
    area_id INT NOT NULL,
    FOREIGN KEY (area_id) REFERENCES areas(area_id),
    spaza_id INT NOT NULL,
    FOREIGN KEY (spaza_id) REFERENCES spaza_shops(spaza_shop_id),
    food_item_id INT NOT NULL,
    FOREIGN KEY (food_item_id) REFERENCES food_items(food_item_id),
    discount_id INT NOT NULL,
    FOREIGN KEY (discount_id) REFERENCES discounts(discount_id)
);
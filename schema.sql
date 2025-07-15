-- Equipment Table
CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    model VARCHAR(50),
    manufacturer VARCHAR(100),
    purchase_date DATE,
    purchase_price DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('Available', 'In Use', 'Under Maintenance', 'Retired')),
    last_maintenance_date DATE,
    next_maintenance_date DATE
);

-- Farmers Table
CREATE TABLE farmers (
    farmer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- Equipment Rentals Table
CREATE TABLE equipment_rentals (
    rental_id INT PRIMARY KEY IDENTITY(1,1),
    equipment_id INT FOREIGN KEY REFERENCES equipment(equipment_id),
    farmer_id INT FOREIGN KEY REFERENCES farmers(farmer_id),
    rental_start_date DATE NOT NULL,
    rental_end_date DATE,
    rental_price DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('Active', 'Completed', 'Cancelled'))
);

-- Maintenance Records Table
CREATE TABLE maintenance_records (
    record_id INT PRIMARY KEY IDENTITY(1,1),
    equipment_id INT FOREIGN KEY REFERENCES equipment(equipment_id),
    maintenance_date DATE NOT NULL,
    description TEXT,
    cost DECIMAL(10,2),
    performed_by VARCHAR(100)
);

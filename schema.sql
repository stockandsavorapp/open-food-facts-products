CREATE TABLE open_product (
    gtin14 TEXT PRIMARY KEY CHECK (
        length(gtin14) = 14 AND gtin14 NOT GLOB '*[^0-9]*' AND substr(gtin14, 1, 1) = '0'),
    name TEXT NOT NULL CHECK (length(trim(name)) > 0),
    brand_name TEXT,
    package_size TEXT,
    description TEXT NOT NULL DEFAULT '',
    size_amount REAL,
    size_unit TEXT,
    size_count INTEGER,
    name_origin TEXT NOT NULL CHECK (name_origin IN ('rules', 'agent', 'owner')),
    modified TEXT
) WITHOUT ROWID;

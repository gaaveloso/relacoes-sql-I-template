-- Active: 1674045340959@@127.0.0.1@3306

-- Práticas

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE
    phones (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        phone_number TEXT UNIQUE NOT NULL,
        user_id TEXT NOT NULL,
        FOREIGN Key (user_id) REFERENCES users (id)
    );

SELECT * FROM phones;

INSERT INTO
    users (id, name, email, password)
VALUES (
        "u001",
        "João",
        "joao@labenu.com",
        "123456"
    ), (
        "u002",
        "Maria",
        "maria@labenu.com",
        "654321"
    );

INSERT INTO
    phones (id, phone_number, user_id)
VALUES ("p001", "551199999999", "u001"), ("p002", "551198888999", "u002"), ("p003", "55669997788", "u003");

SELECT
    users.id as userId,
    users.name,
    users.email,
    users.password,
    phones.id as phoneId,
    phones.phone_number,
    phones.user_id
FROM users
    INNER JOIN phones ON phones.user_id = users.id;

CREATE TABLE
    licenses (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        register_number TEXT UNIQUE NOT NULL,
        category TEXT NOT NULL
    );

CREATE TABLE
    drivers (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        license_id TEXT UNIQUE NOT NULL,
        FOREIGN KEY (license_id) REFERENCES licenses (id)
    );

INSERT INTO
    licenses (id, register_number, category)
VALUES ("l003", "11122311", "A"), ("l004", "1123123112222", "AB");

INSERT INTO
    drivers (
        id,
        name,
        email,
        password,
        license_id
    )
VALUES (
        "d001",
        "joao",
        "joao@labenu.com",
        "123456",
        "l001"
    ), (
        "d002",
        "maria",
        "maria@labenu.com",
        "1454981",
        "l002"
    );

    SELECT * FROM licenses
    INNER JOIN drivers
    ON drivers.license_id = licenses.id;

    SELECT * FROM licenses
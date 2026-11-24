CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);

CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);

CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title CHAR(20)
);

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name CHAR(30)
);

CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
)
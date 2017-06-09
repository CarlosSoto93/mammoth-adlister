USE adlister_db;



CREATE TABLE user (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(50),
  PRIMARY KEY (id)
)
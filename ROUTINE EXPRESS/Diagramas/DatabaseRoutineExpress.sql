DROP DATABASE IF EXISTS routine_express;
CREATE DATABASE routine_express;

USE routine_express;

CREATE TABLE continent (
  id INT PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT
);

CREATE TABLE country (
  id INT PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  continent_id INT,
  FOREIGN KEY (continent_id) REFERENCES continent(id)
);

CREATE TABLE departament (
  id INT PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE municipality (
  id INT PRIMARY KEY AUTO_INCREMENT,
  code VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  status_id INT,
  FOREIGN KEY (status_id) REFERENCES departament(id)
);

CREATE TABLE role (
  id INT PRIMARY KEY AUTO_INCREMENT,
  created_at DATETIME,
  created_by INT,
  deleted_at DATETIME,
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME,
  updated_by INT,
  name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE person (
  id INT PRIMARY KEY AUTO_INCREMENT,
  document VARCHAR(255) NOT NULL UNIQUE,
  address VARCHAR(255) NOT NULL,
  date_birth DATE NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  gender VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  type_document VARCHAR(255) NOT NULL,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  municipality_id INT,
  FOREIGN KEY (municipality_id) REFERENCES municipality(id)
);

CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255),
  password VARCHAR(255),
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  person_id INT,
  FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE user_role (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  role_id INT,
  FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE view (
  id INT PRIMARY KEY AUTO_INCREMENT,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  name VARCHAR(255),
  description VARCHAR(255),
  route VARCHAR(255)
);

CREATE TABLE rol_view (
  id INT PRIMARY KEY AUTO_INCREMENT,
  rol_id INT,
  view_id INT,
  FOREIGN KEY (rol_id) REFERENCES role(id),
  FOREIGN KEY (view_id) REFERENCES view(id)
);

CREATE TABLE module (
  id INT PRIMARY KEY AUTO_INCREMENT,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE module_view (
  id INT PRIMARY KEY AUTO_INCREMENT,
  module_id INT,
  view_id INT,
  FOREIGN KEY (module_id) REFERENCES module(id),
  FOREIGN KEY (view_id) REFERENCES view(id)
);

CREATE TABLE routine_type (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description VARCHAR(100),
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT
);

CREATE TABLE routines (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  routine_name VARCHAR(100),
  routine_type INT,
  start_time TIME,
  end_time TIME,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (routine_type) REFERENCES routine_type(id)
);

CREATE TABLE activities (
  id INT PRIMARY KEY AUTO_INCREMENT,
  routine_id INT,
  activity_name VARCHAR(100),
  description TEXT,
  start_time TIME,
  end_time TIME,
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  FOREIGN KEY (routine_id) REFERENCES routines(id)
);

CREATE TABLE settings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  notifications BOOLEAN,
  vibration BOOLEAN,
  alarm_sound VARCHAR(100),
  theme_mode VARCHAR(50),
  theme_color VARCHAR(50),
  created_at DATETIME(6),
  created_by INT,
  deleted_at DATETIME(6),
  deleted_by INT,
  state BIT NOT NULL,
  updated_at DATETIME(6),
  updated_by INT,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

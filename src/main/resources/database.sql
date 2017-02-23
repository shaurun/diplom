-- Table: users
CREATE TABLE users (
  id        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  username  VARCHAR(255)  NOT NULL ,
  password  VARCHAR(255)  NOT NULL
)
  ENGINE  = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name      VARCHAR(100)  NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles
CREATE TABLE user_roles (
  user_id   INT           NOT NULL ,
  role_id   INT           NOT NULL ,

  FOREIGN KEY (user_id) REFERENCES users(id) ,
  FOREIGN KEY (role_id) REFERENCES roles(id) ,

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Insert data

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

-- Table: news
CREATE TABLE news (
  id      INT             NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  title   VARCHAR(255)    NOT NULL ,
  info  TEXT            NOT NULL ,
  date  DATETIME        NOT NULL
)
  ENGINE = InnoDB;

-- Tasble: subjects
CREATE TABLE subjects (
  id      INT             NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name    VARCHAR(255)    NOT NULL ,
  user_id  INT            NOT NULL ,

  FOREIGN KEY (user_id) REFERENCES users(id)
)
  ENGINE = InnoDB;

-- Tasble: topics
CREATE TABLE topics (
  id      INT             NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name    VARCHAR(255)    NOT NULL ,
  subject_id  INT         NOT NULL ,

  FOREIGN KEY (subject_id) REFERENCES subjects(id)
)
  ENGINE = InnoDB;

-- Tasble: lessons
CREATE TABLE lessons (
  id      INT             NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name    VARCHAR(255)    NOT NULL ,
  status  SMALLINT        ,
  subject_id  INT         NOT NULL ,
  color   VARCHAR(7)      DEFAULT '#FFFFFF' ,

  FOREIGN KEY (subject_id) REFERENCES subjects(id)
)
  ENGINE = InnoDB;

-- Tasble: words
CREATE TABLE words (
  id            INT             NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  word          VARCHAR(255)    NOT NULL ,
  translation   VARCHAR(255)    NOT NULL ,
  lesson_id     INT             ,
  topic_id      INT             ,

  FOREIGN KEY (lesson_id) REFERENCES lessons(id),
  FOREIGN KEY (topic_id)  REFERENCES topics(id)
)
  ENGINE = InnoDB;


show variables like 'char%';
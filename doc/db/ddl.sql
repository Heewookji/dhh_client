--외래 키 constraints 허용
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS `home`;
DROP TABLE IF EXISTS `home_location`;
DROP TABLE IF EXISTS `status`;
DROP TABLE IF EXISTS `character`;
DROP TABLE IF EXISTS `question`;
DROP TABLE IF EXISTS `diary`;

CREATE TABLE `character` (
                             `id` INTEGER	NOT NULL primary key autoincrement ,
                             `name`	varchar(15)	NOT NULL,
                             'color' INTEGER NOT NULL DEFAULT 0xFF14213D,
                             `description`	longtext 	NULL,
                             `is_npc`	bit(1)	NOT NULL	DEFAULT false
);


CREATE TABLE `question` (
                            `id`	INTEGER	NOT NULL primary key autoincrement,
                            `character_id`	INTEGER	NOT NULL,
                            `text`	longtext	NOT NULL
);



CREATE TABLE `diary` (
                         `id`	INTEGER	NOT NULL primary key autoincrement,
                         `question_id`	INTEGER	NOT NULL,
                         `text`	longtext	NOT NULL,
                         `created_at`	datetime	NOT NULL
);



CREATE TABLE `status` (
                          `code`	INTEGER	NOT NULL,
                          `character_id`	INTEGER	NOT NULL,
                          `image_url`	longtext	NOT NULL,
                          `is_status_now`	bit(1)	NOT NULL	DEFAULT false,
                          PRIMARY Key(code, character_id),
                          FOREIGN KEY (character_id)
                              REFERENCES character (id)
);

CREATE TABLE `home` (
                         `modified_at`	datetime	NULL
);

CREATE TABLE `home_location` (
                        `id`	INTEGER	NOT NULL primary key autoincrement,
                        `character_id`	INTEGER	NULL
);





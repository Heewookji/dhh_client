--         Character(
--              (b) => b
--                  ..isHome = 1
--                  ..isTravel = 1
--                  ..color = 0xFFFFFFFF
--                  ..name = 'test'
--                  ..isNpc = 1
--                  ..statusCode = 1
--                  ..statusImageUrl = '',
--          ),
--           Question(
--             (b) => b
--               ..characterId = 1
--               ..text = 'test',
--           ),
--           Diary(
--             (b) => b
--               ..questionId = 1
--               ..text = 'testQ'
--               ..createdAt = DateTime.now(),
--           ),




-- 캐릭터
insert into character(id, name, color) values (1,'캐릭1', 0xFF11C3FC);
insert into character(id, name, color) values (2,'캐릭2', 0xFFFCA311);
insert into character(id, name, color) values (3,'캐릭3', 0xFF14213D);
insert into character(id, name, color) values (4,'캐릭4', 0xFF4059AD);
insert into character(id, name, color) values (5,'캐릭5', 0xFF6B9AC4);
insert into character(id, name, color) values (6,'캐릭6', 0xFF97D8C4);
insert into character(id, name, color) values (7,'캐릭7', 0xFFF4B942);
insert into character(id, name, color) values (8,'캐릭8', 0xFF4DAA57);
insert into character(id, name, color) values (9,'캐릭9', 0xFF754668);
insert into character(id, name, color) values (10,'캐릭10', 0xFFD62246);
insert into character(id, name, is_npc, color) values (11,'npc1', 1, 0xFF000000);
insert into character(id, name, is_npc, color) values (12,'npc2', 1, 0xFF000000);
insert into character(id, name, is_npc, color) values (13,'npc3', 1, 0xFF000000);

-- 홈
insert into home(modified_at) values (null);

-- 홈 캐릭터 위치

insert into home_location(id) values (1);
insert into home_location(id) values (2);
insert into home_location(id) values (3);
insert into home_location(id) values (4);
insert into home_location(id) values (5);
insert into home_location(id) values (6);
insert into home_location(id) values (7);
insert into home_location(id) values (8);

--캐릭터 스테이터스 (캐릭터당 6개)
insert into status (code, character_id, image_url, is_status_now) values (1,1,'assets/images/1-1.png', true);
insert into status (code, character_id, image_url) values (2,1,'assets/images/1-2.png');
insert into status (code, character_id, image_url) values (3,1,'assets/images/1-3.png');
insert into status (code, character_id, image_url) values (4,1,'assets/images/1-4.png');
insert into status (code, character_id, image_url) values (5,1,'assets/images/1-5.png');
insert into status (code, character_id, image_url) values (6,1,'assets/images/1-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,2,'assets/images/2-1.png', true);
insert into status (code, character_id, image_url) values (2,2,'assets/images/2-2.png');
insert into status (code, character_id, image_url) values (3,2,'assets/images/2-3.png');
insert into status (code, character_id, image_url) values (4,2,'assets/images/2-4.png');
insert into status (code, character_id, image_url) values (5,2,'assets/images/2-5.png');
insert into status (code, character_id, image_url) values (6,2,'assets/images/2-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,3,'assets/images/3-1.png', true);
insert into status (code, character_id, image_url) values (2,3,'assets/images/3-2.png');
insert into status (code, character_id, image_url) values (3,3,'assets/images/3-3.png');
insert into status (code, character_id, image_url) values (4,3,'assets/images/3-4.png');
insert into status (code, character_id, image_url) values (5,3,'assets/images/3-5.png');
insert into status (code, character_id, image_url) values (6,3,'assets/images/3-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,4,'assets/images/4-1.png', true);
insert into status (code, character_id, image_url) values (2,4,'assets/images/4-2.png');
insert into status (code, character_id, image_url) values (3,4,'assets/images/4-3.png');
insert into status (code, character_id, image_url) values (4,4,'assets/images/4-4.png');
insert into status (code, character_id, image_url) values (5,4,'assets/images/4-5.png');
insert into status (code, character_id, image_url) values (6,4,'assets/images/4-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,5,'assets/images/5-1.png', true);
insert into status (code, character_id, image_url) values (2,5,'assets/images/5-2.png');
insert into status (code, character_id, image_url) values (3,5,'assets/images/5-3.png');
insert into status (code, character_id, image_url) values (4,5,'assets/images/5-4.png');
insert into status (code, character_id, image_url) values (5,5,'assets/images/5-5.png');
insert into status (code, character_id, image_url) values (6,5,'assets/images/5-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,6,'assets/images/6-1.png', true);
insert into status (code, character_id, image_url) values (2,6,'assets/images/6-2.png');
insert into status (code, character_id, image_url) values (3,6,'assets/images/6-3.png');
insert into status (code, character_id, image_url) values (4,6,'assets/images/6-4.png');
insert into status (code, character_id, image_url) values (5,6,'assets/images/6-5.png');
insert into status (code, character_id, image_url) values (6,6,'assets/images/6-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,7,'assets/images/7-1.png', true);
insert into status (code, character_id, image_url) values (2,7,'assets/images/7-2.png');
insert into status (code, character_id, image_url) values (3,7,'assets/images/7-3.png');
insert into status (code, character_id, image_url) values (4,7,'assets/images/7-4.png');
insert into status (code, character_id, image_url) values (5,7,'assets/images/7-5.png');
insert into status (code, character_id, image_url) values (6,7,'assets/images/7-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,8,'assets/images/8-1.png', true);
insert into status (code, character_id, image_url) values (2,8,'assets/images/8-2.png');
insert into status (code, character_id, image_url) values (3,8,'assets/images/8-3.png');
insert into status (code, character_id, image_url) values (4,8,'assets/images/8-4.png');
insert into status (code, character_id, image_url) values (5,8,'assets/images/8-5.png');
insert into status (code, character_id, image_url) values (6,8,'assets/images/8-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,9,'assets/images/9-1.png', true);
insert into status (code, character_id, image_url) values (2,9,'assets/images/9-2.png');
insert into status (code, character_id, image_url) values (3,9,'assets/images/9-3.png');
insert into status (code, character_id, image_url) values (4,9,'assets/images/9-4.png');
insert into status (code, character_id, image_url) values (5,9,'assets/images/9-5.png');
insert into status (code, character_id, image_url) values (6,9,'assets/images/9-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,10,'assets/images/10-1.png', true);
insert into status (code, character_id, image_url) values (2,10,'assets/images/10-2.png');
insert into status (code, character_id, image_url) values (3,10,'assets/images/10-3.png');
insert into status (code, character_id, image_url) values (4,10,'assets/images/10-4.png');
insert into status (code, character_id, image_url) values (5,10,'assets/images/10-5.png');
insert into status (code, character_id, image_url) values (6,10,'assets/images/10-6.png');
insert into status (code, character_id, image_url, is_status_now) values (1,11,'assets/images/11-1.png', true);
insert into status (code, character_id, image_url, is_status_now) values (1,12,'assets/images/12-1.png', true);
insert into status (code, character_id, image_url, is_status_now) values (1,13,'assets/images/13-1.png', true);

--퀘스쳔

insert into question(character_id, text) VALUES (1, '캐릭1질문1');
insert into question(character_id, text) VALUES (1, '캐릭1질문2');
insert into question(character_id, text) VALUES (1, '캐릭1질문3');
insert into question(character_id, text) VALUES (1, '캐릭1질문4');
insert into question(character_id, text) VALUES (1, '캐릭1질문5');
insert into question(character_id, text) VALUES (1, '캐릭1질문6');
insert into question(character_id, text) VALUES (1, '캐릭1질문7');
insert into question(character_id, text) VALUES (1, '캐릭1질문8');
insert into question(character_id, text) VALUES (1, '캐릭1질문9');
insert into question(character_id, text) VALUES (1, '캐릭1질문10');
insert into question(character_id, text) VALUES (1, '캐릭1질문11');
insert into question(character_id, text) VALUES (1, '캐릭1질문12');
insert into question(character_id, text) VALUES (1, '캐릭1질문13');
insert into question(character_id, text) VALUES (1, '캐릭1질문14');
insert into question(character_id, text) VALUES (1, '캐릭1질문15');
insert into question(character_id, text) VALUES (1, '캐릭1질문16');
insert into question(character_id, text) VALUES (1, '캐릭1질문17');
insert into question(character_id, text) VALUES (1, '캐릭1질문18');
insert into question(character_id, text) VALUES (1, '캐릭1질문19');
insert into question(character_id, text) VALUES (1, '캐릭1질문20');
insert into question(character_id, text) VALUES (1, '캐릭1질문21');
insert into question(character_id, text) VALUES (1, '캐릭1질문22');
insert into question(character_id, text) VALUES (1, '캐릭1질문23');
insert into question(character_id, text) VALUES (1, '캐릭1질문24');
insert into question(character_id, text) VALUES (1, '캐릭1질문25');
insert into question(character_id, text) VALUES (1, '캐릭1질문26');
insert into question(character_id, text) VALUES (1, '캐릭1질문27');
insert into question(character_id, text) VALUES (1, '캐릭1질문28');
insert into question(character_id, text) VALUES (1, '캐릭1질문29');
insert into question(character_id, text) VALUES (1, '캐릭1질문30');

insert into question(character_id, text) VALUES (2, '캐릭2질문1');
insert into question(character_id, text) VALUES (2, '캐릭2질문2');
insert into question(character_id, text) VALUES (2, '캐릭2질문3');
insert into question(character_id, text) VALUES (2, '캐릭2질문4');
insert into question(character_id, text) VALUES (2, '캐릭2질문5');
insert into question(character_id, text) VALUES (2, '캐릭2질문6');
insert into question(character_id, text) VALUES (2, '캐릭2질문7');
insert into question(character_id, text) VALUES (2, '캐릭2질문8');
insert into question(character_id, text) VALUES (2, '캐릭2질문9');
insert into question(character_id, text) VALUES (2, '캐릭2질문10');
insert into question(character_id, text) VALUES (2, '캐릭2질문11');
insert into question(character_id, text) VALUES (2, '캐릭2질문12');
insert into question(character_id, text) VALUES (2, '캐릭2질문13');
insert into question(character_id, text) VALUES (2, '캐릭2질문14');
insert into question(character_id, text) VALUES (2, '캐릭2질문15');
insert into question(character_id, text) VALUES (2, '캐릭2질문16');
insert into question(character_id, text) VALUES (2, '캐릭2질문17');
insert into question(character_id, text) VALUES (2, '캐릭2질문18');
insert into question(character_id, text) VALUES (2, '캐릭2질문19');
insert into question(character_id, text) VALUES (2, '캐릭2질문20');
insert into question(character_id, text) VALUES (2, '캐릭2질문21');
insert into question(character_id, text) VALUES (2, '캐릭2질문22');
insert into question(character_id, text) VALUES (2, '캐릭2질문23');
insert into question(character_id, text) VALUES (2, '캐릭2질문24');
insert into question(character_id, text) VALUES (2, '캐릭2질문25');
insert into question(character_id, text) VALUES (2, '캐릭2질문26');
insert into question(character_id, text) VALUES (2, '캐릭2질문27');
insert into question(character_id, text) VALUES (2, '캐릭2질문28');
insert into question(character_id, text) VALUES (2, '캐릭2질문29');
insert into question(character_id, text) VALUES (2, '캐릭2질문30');

insert into question(character_id, text) VALUES (3, '캐릭3질문1');
insert into question(character_id, text) VALUES (3, '캐릭3질문2');
insert into question(character_id, text) VALUES (3, '캐릭3질문3');
insert into question(character_id, text) VALUES (3, '캐릭3질문4');
insert into question(character_id, text) VALUES (3, '캐릭3질문5');
insert into question(character_id, text) VALUES (3, '캐릭3질문6');
insert into question(character_id, text) VALUES (3, '캐릭3질문7');
insert into question(character_id, text) VALUES (3, '캐릭3질문8');
insert into question(character_id, text) VALUES (3, '캐릭3질문9');
insert into question(character_id, text) VALUES (3, '캐릭3질문10');
insert into question(character_id, text) VALUES (3, '캐릭3질문11');
insert into question(character_id, text) VALUES (3, '캐릭3질문12');
insert into question(character_id, text) VALUES (3, '캐릭3질문13');
insert into question(character_id, text) VALUES (3, '캐릭3질문14');
insert into question(character_id, text) VALUES (3, '캐릭3질문15');
insert into question(character_id, text) VALUES (3, '캐릭3질문16');
insert into question(character_id, text) VALUES (3, '캐릭3질문17');
insert into question(character_id, text) VALUES (3, '캐릭3질문18');
insert into question(character_id, text) VALUES (3, '캐릭3질문19');
insert into question(character_id, text) VALUES (3, '캐릭3질문20');
insert into question(character_id, text) VALUES (3, '캐릭3질문21');
insert into question(character_id, text) VALUES (3, '캐릭3질문22');
insert into question(character_id, text) VALUES (3, '캐릭3질문23');
insert into question(character_id, text) VALUES (3, '캐릭3질문24');
insert into question(character_id, text) VALUES (3, '캐릭3질문25');
insert into question(character_id, text) VALUES (3, '캐릭3질문26');
insert into question(character_id, text) VALUES (3, '캐릭3질문27');
insert into question(character_id, text) VALUES (3, '캐릭3질문28');
insert into question(character_id, text) VALUES (3, '캐릭3질문29');
insert into question(character_id, text) VALUES (3, '캐릭3질문30');

insert into question(character_id, text) VALUES (4, '캐릭4질문1');
insert into question(character_id, text) VALUES (4, '캐릭4질문2');
insert into question(character_id, text) VALUES (4, '캐릭4질문3');
insert into question(character_id, text) VALUES (4, '캐릭4질문4');
insert into question(character_id, text) VALUES (4, '캐릭4질문5');
insert into question(character_id, text) VALUES (4, '캐릭4질문6');
insert into question(character_id, text) VALUES (4, '캐릭4질문7');
insert into question(character_id, text) VALUES (4, '캐릭4질문8');
insert into question(character_id, text) VALUES (4, '캐릭4질문9');
insert into question(character_id, text) VALUES (4, '캐릭4질문10');
insert into question(character_id, text) VALUES (4, '캐릭4질문11');
insert into question(character_id, text) VALUES (4, '캐릭4질문12');
insert into question(character_id, text) VALUES (4, '캐릭4질문13');
insert into question(character_id, text) VALUES (4, '캐릭4질문14');
insert into question(character_id, text) VALUES (4, '캐릭4질문15');
insert into question(character_id, text) VALUES (4, '캐릭4질문16');
insert into question(character_id, text) VALUES (4, '캐릭4질문17');
insert into question(character_id, text) VALUES (4, '캐릭4질문18');
insert into question(character_id, text) VALUES (4, '캐릭4질문19');
insert into question(character_id, text) VALUES (4, '캐릭4질문20');
insert into question(character_id, text) VALUES (4, '캐릭4질문21');
insert into question(character_id, text) VALUES (4, '캐릭4질문22');
insert into question(character_id, text) VALUES (4, '캐릭4질문23');
insert into question(character_id, text) VALUES (4, '캐릭4질문24');
insert into question(character_id, text) VALUES (4, '캐릭4질문25');
insert into question(character_id, text) VALUES (4, '캐릭4질문26');
insert into question(character_id, text) VALUES (4, '캐릭4질문27');
insert into question(character_id, text) VALUES (4, '캐릭4질문28');
insert into question(character_id, text) VALUES (4, '캐릭4질문29');
insert into question(character_id, text) VALUES (4, '캐릭4질문30');

insert into question(character_id, text) VALUES (5, '캐릭5질문1');
insert into question(character_id, text) VALUES (5, '캐릭5질문2');
insert into question(character_id, text) VALUES (5, '캐릭5질문3');
insert into question(character_id, text) VALUES (5, '캐릭5질문4');
insert into question(character_id, text) VALUES (5, '캐릭5질문5');
insert into question(character_id, text) VALUES (5, '캐릭5질문6');
insert into question(character_id, text) VALUES (5, '캐릭5질문7');
insert into question(character_id, text) VALUES (5, '캐릭5질문8');
insert into question(character_id, text) VALUES (5, '캐릭5질문9');
insert into question(character_id, text) VALUES (5, '캐릭5질문10');
insert into question(character_id, text) VALUES (5, '캐릭5질문11');
insert into question(character_id, text) VALUES (5, '캐릭5질문12');
insert into question(character_id, text) VALUES (5, '캐릭5질문13');
insert into question(character_id, text) VALUES (5, '캐릭5질문14');
insert into question(character_id, text) VALUES (5, '캐릭5질문15');
insert into question(character_id, text) VALUES (5, '캐릭5질문16');
insert into question(character_id, text) VALUES (5, '캐릭5질문17');
insert into question(character_id, text) VALUES (5, '캐릭5질문18');
insert into question(character_id, text) VALUES (5, '캐릭5질문19');
insert into question(character_id, text) VALUES (5, '캐릭5질문20');
insert into question(character_id, text) VALUES (5, '캐릭5질문21');
insert into question(character_id, text) VALUES (5, '캐릭5질문22');
insert into question(character_id, text) VALUES (5, '캐릭5질문23');
insert into question(character_id, text) VALUES (5, '캐릭5질문24');
insert into question(character_id, text) VALUES (5, '캐릭5질문25');
insert into question(character_id, text) VALUES (5, '캐릭5질문26');
insert into question(character_id, text) VALUES (5, '캐릭5질문27');
insert into question(character_id, text) VALUES (5, '캐릭5질문28');
insert into question(character_id, text) VALUES (5, '캐릭5질문29');
insert into question(character_id, text) VALUES (5, '캐릭5질문30');

insert into question(character_id, text) VALUES (6, '캐릭6질문1');
insert into question(character_id, text) VALUES (6, '캐릭6질문2');
insert into question(character_id, text) VALUES (6, '캐릭6질문3');
insert into question(character_id, text) VALUES (6, '캐릭6질문4');
insert into question(character_id, text) VALUES (6, '캐릭6질문5');
insert into question(character_id, text) VALUES (6, '캐릭6질문6');
insert into question(character_id, text) VALUES (6, '캐릭6질문7');
insert into question(character_id, text) VALUES (6, '캐릭6질문8');
insert into question(character_id, text) VALUES (6, '캐릭6질문9');
insert into question(character_id, text) VALUES (6, '캐릭6질문10');
insert into question(character_id, text) VALUES (6, '캐릭6질문11');
insert into question(character_id, text) VALUES (6, '캐릭6질문12');
insert into question(character_id, text) VALUES (6, '캐릭6질문13');
insert into question(character_id, text) VALUES (6, '캐릭6질문14');
insert into question(character_id, text) VALUES (6, '캐릭6질문15');
insert into question(character_id, text) VALUES (6, '캐릭6질문16');
insert into question(character_id, text) VALUES (6, '캐릭6질문17');
insert into question(character_id, text) VALUES (6, '캐릭6질문18');
insert into question(character_id, text) VALUES (6, '캐릭6질문19');
insert into question(character_id, text) VALUES (6, '캐릭6질문20');
insert into question(character_id, text) VALUES (6, '캐릭6질문21');
insert into question(character_id, text) VALUES (6, '캐릭6질문22');
insert into question(character_id, text) VALUES (6, '캐릭6질문23');
insert into question(character_id, text) VALUES (6, '캐릭6질문24');
insert into question(character_id, text) VALUES (6, '캐릭6질문25');
insert into question(character_id, text) VALUES (6, '캐릭6질문26');
insert into question(character_id, text) VALUES (6, '캐릭6질문27');
insert into question(character_id, text) VALUES (6, '캐릭6질문28');
insert into question(character_id, text) VALUES (6, '캐릭6질문29');
insert into question(character_id, text) VALUES (6, '캐릭6질문30');

insert into question(character_id, text) VALUES (7, '캐릭7질문1');
insert into question(character_id, text) VALUES (7, '캐릭7질문2');
insert into question(character_id, text) VALUES (7, '캐릭7질문3');
insert into question(character_id, text) VALUES (7, '캐릭7질문4');
insert into question(character_id, text) VALUES (7, '캐릭7질문5');
insert into question(character_id, text) VALUES (7, '캐릭7질문6');
insert into question(character_id, text) VALUES (7, '캐릭7질문7');
insert into question(character_id, text) VALUES (7, '캐릭7질문8');
insert into question(character_id, text) VALUES (7, '캐릭7질문9');
insert into question(character_id, text) VALUES (7, '캐릭7질문10');
insert into question(character_id, text) VALUES (7, '캐릭7질문11');
insert into question(character_id, text) VALUES (7, '캐릭7질문12');
insert into question(character_id, text) VALUES (7, '캐릭7질문13');
insert into question(character_id, text) VALUES (7, '캐릭7질문14');
insert into question(character_id, text) VALUES (7, '캐릭7질문15');
insert into question(character_id, text) VALUES (7, '캐릭7질문16');
insert into question(character_id, text) VALUES (7, '캐릭7질문17');
insert into question(character_id, text) VALUES (7, '캐릭7질문18');
insert into question(character_id, text) VALUES (7, '캐릭7질문19');
insert into question(character_id, text) VALUES (7, '캐릭7질문20');
insert into question(character_id, text) VALUES (7, '캐릭7질문21');
insert into question(character_id, text) VALUES (7, '캐릭7질문22');
insert into question(character_id, text) VALUES (7, '캐릭7질문23');
insert into question(character_id, text) VALUES (7, '캐릭7질문24');
insert into question(character_id, text) VALUES (7, '캐릭7질문25');
insert into question(character_id, text) VALUES (7, '캐릭7질문26');
insert into question(character_id, text) VALUES (7, '캐릭7질문27');
insert into question(character_id, text) VALUES (7, '캐릭7질문28');
insert into question(character_id, text) VALUES (7, '캐릭7질문29');
insert into question(character_id, text) VALUES (7, '캐릭7질문30');

insert into question(character_id, text) VALUES (8, '캐릭8질문1');
insert into question(character_id, text) VALUES (8, '캐릭8질문2');
insert into question(character_id, text) VALUES (8, '캐릭8질문3');
insert into question(character_id, text) VALUES (8, '캐릭8질문4');
insert into question(character_id, text) VALUES (8, '캐릭8질문5');
insert into question(character_id, text) VALUES (8, '캐릭8질문6');
insert into question(character_id, text) VALUES (8, '캐릭8질문7');
insert into question(character_id, text) VALUES (8, '캐릭8질문8');
insert into question(character_id, text) VALUES (8, '캐릭8질문9');
insert into question(character_id, text) VALUES (8, '캐릭8질문10');
insert into question(character_id, text) VALUES (8, '캐릭8질문11');
insert into question(character_id, text) VALUES (8, '캐릭8질문12');
insert into question(character_id, text) VALUES (8, '캐릭8질문13');
insert into question(character_id, text) VALUES (8, '캐릭8질문14');
insert into question(character_id, text) VALUES (8, '캐릭8질문15');
insert into question(character_id, text) VALUES (8, '캐릭8질문16');
insert into question(character_id, text) VALUES (8, '캐릭8질문17');
insert into question(character_id, text) VALUES (8, '캐릭8질문18');
insert into question(character_id, text) VALUES (8, '캐릭8질문19');
insert into question(character_id, text) VALUES (8, '캐릭8질문20');
insert into question(character_id, text) VALUES (8, '캐릭8질문21');
insert into question(character_id, text) VALUES (8, '캐릭8질문22');
insert into question(character_id, text) VALUES (8, '캐릭8질문23');
insert into question(character_id, text) VALUES (8, '캐릭8질문24');
insert into question(character_id, text) VALUES (8, '캐릭8질문25');
insert into question(character_id, text) VALUES (8, '캐릭8질문26');
insert into question(character_id, text) VALUES (8, '캐릭8질문27');
insert into question(character_id, text) VALUES (8, '캐릭8질문28');
insert into question(character_id, text) VALUES (8, '캐릭8질문29');
insert into question(character_id, text) VALUES (8, '캐릭8질문30');

insert into question(character_id, text) VALUES (9, '캐릭9질문1');
insert into question(character_id, text) VALUES (9, '캐릭9질문2');
insert into question(character_id, text) VALUES (9, '캐릭9질문3');
insert into question(character_id, text) VALUES (9, '캐릭9질문4');
insert into question(character_id, text) VALUES (9, '캐릭9질문5');
insert into question(character_id, text) VALUES (9, '캐릭9질문6');
insert into question(character_id, text) VALUES (9, '캐릭9질문7');
insert into question(character_id, text) VALUES (9, '캐릭9질문8');
insert into question(character_id, text) VALUES (9, '캐릭9질문9');
insert into question(character_id, text) VALUES (9, '캐릭9질문10');
insert into question(character_id, text) VALUES (9, '캐릭9질문11');
insert into question(character_id, text) VALUES (9, '캐릭9질문12');
insert into question(character_id, text) VALUES (9, '캐릭9질문13');
insert into question(character_id, text) VALUES (9, '캐릭9질문14');
insert into question(character_id, text) VALUES (9, '캐릭9질문15');
insert into question(character_id, text) VALUES (9, '캐릭9질문16');
insert into question(character_id, text) VALUES (9, '캐릭9질문17');
insert into question(character_id, text) VALUES (9, '캐릭9질문18');
insert into question(character_id, text) VALUES (9, '캐릭9질문19');
insert into question(character_id, text) VALUES (9, '캐릭9질문20');
insert into question(character_id, text) VALUES (9, '캐릭9질문21');
insert into question(character_id, text) VALUES (9, '캐릭9질문22');
insert into question(character_id, text) VALUES (9, '캐릭9질문23');
insert into question(character_id, text) VALUES (9, '캐릭9질문24');
insert into question(character_id, text) VALUES (9, '캐릭9질문25');
insert into question(character_id, text) VALUES (9, '캐릭9질문26');
insert into question(character_id, text) VALUES (9, '캐릭9질문27');
insert into question(character_id, text) VALUES (9, '캐릭9질문28');
insert into question(character_id, text) VALUES (9, '캐릭9질문29');
insert into question(character_id, text) VALUES (9, '캐릭9질문30');

insert into question(character_id, text) VALUES (10, '캐릭10질문1');
insert into question(character_id, text) VALUES (10, '캐릭10질문2');
insert into question(character_id, text) VALUES (10, '캐릭10질문3');
insert into question(character_id, text) VALUES (10, '캐릭10질문4');
insert into question(character_id, text) VALUES (10, '캐릭10질문5');
insert into question(character_id, text) VALUES (10, '캐릭10질문6');
insert into question(character_id, text) VALUES (10, '캐릭10질문7');
insert into question(character_id, text) VALUES (10, '캐릭10질문8');
insert into question(character_id, text) VALUES (10, '캐릭10질문9');
insert into question(character_id, text) VALUES (10, '캐릭10질문10');
insert into question(character_id, text) VALUES (10, '캐릭10질문11');
insert into question(character_id, text) VALUES (10, '캐릭10질문12');
insert into question(character_id, text) VALUES (10, '캐릭10질문13');
insert into question(character_id, text) VALUES (10, '캐릭10질문14');
insert into question(character_id, text) VALUES (10, '캐릭10질문15');
insert into question(character_id, text) VALUES (10, '캐릭10질문16');
insert into question(character_id, text) VALUES (10, '캐릭10질문17');
insert into question(character_id, text) VALUES (10, '캐릭10질문18');
insert into question(character_id, text) VALUES (10, '캐릭10질문19');
insert into question(character_id, text) VALUES (10, '캐릭10질문20');
insert into question(character_id, text) VALUES (10, '캐릭10질문21');
insert into question(character_id, text) VALUES (10, '캐릭10질문22');
insert into question(character_id, text) VALUES (10, '캐릭10질문23');
insert into question(character_id, text) VALUES (10, '캐릭10질문24');
insert into question(character_id, text) VALUES (10, '캐릭10질문25');
insert into question(character_id, text) VALUES (10, '캐릭10질문26');
insert into question(character_id, text) VALUES (10, '캐릭10질문27');
insert into question(character_id, text) VALUES (10, '캐릭10질문28');
insert into question(character_id, text) VALUES (10, '캐릭10질문29');
insert into question(character_id, text) VALUES (10, '캐릭10질문30');
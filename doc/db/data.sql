        Character(
             (b) => b
                 ..isHome = 1
                 ..isTravel = 1
                 ..color = 0xFFFFFFFF
                 ..name = 'test'
                 ..isNpc = 1
                 ..statusCode = 1
                 ..statusImageUrl = '',
         ),
          Question(
            (b) => b
              ..characterId = 1
              ..text = 'test',
          ),
          Diary(
            (b) => b
              ..questionId = 1
              ..text = 'testQ'
              ..createdAt = DateTime.now(),
          ),



-- 캐릭터
insert into character(id, name, color) values (1,'스타터캐릭1', 0xFF11C3FC);
insert into character(id, name, color) values (2,'스타터캐릭2', 0xFFFCA311);
insert into character(id, name, color) values (3,'스타터캐릭3', 0xFF14213D);
insert into character(id, name) values (4,'캐릭4');
insert into character(id, name) values (5,'캐릭5');
insert into character(id, name) values (6,'캐릭6');
insert into character(id, name, is_npc) values (11,'npc1', 1);
insert into character(id, name, is_npc) values (12,'npc2', 1);


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
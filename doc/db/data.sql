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
insert into character(id, name, color, face_url, description) values (1,'뭉그리' ,  0xFF0061fa, 'assets/images/face_worry'  , '안녕? 내 이름은 뭉그리!\n질척질척 남겨두고 있던 과거의\n미련은 나에게 버려줘!');
insert into character(id, name, color, face_url, description) values (2,'똘똘이',  0xFF3BE3FF,  'assets/images/face_future'  ,'안녕? 내 이름은 똘똘이!\n미래를 어떻게 계획하면 좋을까?\n나랑 같이 이야기해보자.');
insert into character(id, name, color, face_url, description) values (3,'달콩이' ,  0xFFff0084, 'assets/images/face_love'  , '안녕? 내 이름은 달콩이!\n난 다른 사람들의 사랑 이야기를\n엄청! 엄청! 좋아해');
insert into character(id, name, color, face_url, description) values (4,'부우'  ,  0xFFef0033, 'assets/images/face_angry'  , '안녕? 내 이름은 부우!\n세상에는 왜 이렇게 화날 일들이 많은지!\n내가 화나는 이야기 다 들어줄게!');
insert into character(id, name, color, face_url, description) values (5,'상상이' ,  0xFFff9f00, 'assets/images/face_imagine'  , '안녕? 내 이름은 상상이!\n나와 함께라면 되고 싶은 것 무엇이든\n상상해 볼 수 있다고!');
insert into character(id, name, color, face_url, description) values (6,'식타미' ,  0xFFfc5c00, 'assets/images/face_food'  , '안녕? 내 이름은 식타미!\n나는 음식 이야기를 엄청 좋아해!\n너도 먹는 거 좋아하니?');
insert into character(id, name, color, face_url, description) values (7,'룰루'  ,  0xFFffd817, 'assets/images/face_hobby'  , '안녕? 내 이름은 룰루!\n나는 엄청 다양한 취미를 가지고 있어!\n넌 어떤 취미가 있니?');
insert into character(id, name, color, face_url, description) values (8,'보사리' ,  0xFF56e556, 'assets/images/face_people'  , '안녕? 내 이름은 보사리!\n인간관계란 누구라도 어려운 문제지.\n하.하.하.하.하');
insert into character(id, name, color, face_url, description) values (9,'팩폭이' ,  0xFF69b70c, 'assets/images/face_fact'  , '안녕? 내 이름은 팩폭이!\n인생의 쓴맛을 가감 없이 알려줄게!\n자아성찰은 중요하다고!');
insert into character(id, name, color, face_url, description) values (10,'하차니' ,  0xFF760de9, 'assets/images/face_hachani'  , '안녕? 내 이름은 하차니!\n작지만 소중한 일상 이야기는\n삶의 원동력이지~!');

-- 홈
insert into home(modified_at, all_finished, last_traveled_character_id, last_traveled_at) values (null, false, null, null);

--캐릭터 스테이터스 (캐릭터당 6개)
insert into status (code, character_id, image_url, is_status_now) values (1,1,'assets/images/worry_1', true);
insert into status (code, character_id, image_url) values (2,1,'assets/images/worry_2');
insert into status (code, character_id, image_url) values (3,1,'assets/images/worry_3');
insert into status (code, character_id, image_url) values (4,1,'assets/images/worry_4');
insert into status (code, character_id, image_url) values (5,1,'assets/images/worry_5');
insert into status (code, character_id, image_url) values (6,1,'assets/images/worry_6');
insert into status (code, character_id, image_url, is_status_now) values (1,2,'assets/images/future_1', true);
insert into status (code, character_id, image_url) values (2,2,'assets/images/future_2');
insert into status (code, character_id, image_url) values (3,2,'assets/images/future_3');
insert into status (code, character_id, image_url) values (4,2,'assets/images/future_4');
insert into status (code, character_id, image_url) values (5,2,'assets/images/future_5');
insert into status (code, character_id, image_url) values (6,2,'assets/images/future_6');
insert into status (code, character_id, image_url, is_status_now) values (1,3,'assets/images/love_1', true);
insert into status (code, character_id, image_url) values (2,3,'assets/images/love_2');
insert into status (code, character_id, image_url) values (3,3,'assets/images/love_3');
insert into status (code, character_id, image_url) values (4,3,'assets/images/love_4');
insert into status (code, character_id, image_url) values (5,3,'assets/images/love_5');
insert into status (code, character_id, image_url) values (6,3,'assets/images/love_6');
insert into status (code, character_id, image_url, is_status_now) values (1,4,'assets/images/angry_1', true);
insert into status (code, character_id, image_url) values (2,4,'assets/images/angry_2');
insert into status (code, character_id, image_url) values (3,4,'assets/images/angry_3');
insert into status (code, character_id, image_url) values (4,4,'assets/images/angry_4');
insert into status (code, character_id, image_url) values (5,4,'assets/images/angry_5');
insert into status (code, character_id, image_url) values (6,4,'assets/images/angry_6');
insert into status (code, character_id, image_url, is_status_now) values (1,5,'assets/images/imagine_1', true);
insert into status (code, character_id, image_url) values (2,5,'assets/images/imagine_2');
insert into status (code, character_id, image_url) values (3,5,'assets/images/imagine_3');
insert into status (code, character_id, image_url) values (4,5,'assets/images/imagine_4');
insert into status (code, character_id, image_url) values (5,5,'assets/images/imagine_5');
insert into status (code, character_id, image_url) values (6,5,'assets/images/imagine_6');
insert into status (code, character_id, image_url, is_status_now) values (1,6,'assets/images/food_1', true);
insert into status (code, character_id, image_url) values (2,6,'assets/images/food_2');
insert into status (code, character_id, image_url) values (3,6,'assets/images/food_3');
insert into status (code, character_id, image_url) values (4,6,'assets/images/food_4');
insert into status (code, character_id, image_url) values (5,6,'assets/images/food_5');
insert into status (code, character_id, image_url) values (6,6,'assets/images/food_6');
insert into status (code, character_id, image_url, is_status_now) values (1,7,'assets/images/hobby_1', true);
insert into status (code, character_id, image_url) values (2,7,'assets/images/hobby_2');
insert into status (code, character_id, image_url) values (3,7,'assets/images/hobby_3');
insert into status (code, character_id, image_url) values (4,7,'assets/images/hobby_4');
insert into status (code, character_id, image_url) values (5,7,'assets/images/hobby_5');
insert into status (code, character_id, image_url) values (6,7,'assets/images/hobby_6');
insert into status (code, character_id, image_url, is_status_now) values (1,8,'assets/images/people_1', true);
insert into status (code, character_id, image_url) values (2,8,'assets/images/people_2');
insert into status (code, character_id, image_url) values (3,8,'assets/images/people_3');
insert into status (code, character_id, image_url) values (4,8,'assets/images/people_4');
insert into status (code, character_id, image_url) values (5,8,'assets/images/people_5');
insert into status (code, character_id, image_url) values (6,8,'assets/images/people_6');
insert into status (code, character_id, image_url, is_status_now) values (1,9,'assets/images/fact_1', true);
insert into status (code, character_id, image_url) values (2,9,'assets/images/fact_2');
insert into status (code, character_id, image_url) values (3,9,'assets/images/fact_3');
insert into status (code, character_id, image_url) values (4,9,'assets/images/fact_4');
insert into status (code, character_id, image_url) values (5,9,'assets/images/fact_5');
insert into status (code, character_id, image_url) values (6,9,'assets/images/fact_6');
insert into status (code, character_id, image_url, is_status_now) values (1,10,'assets/images/hachani_1', true);
insert into status (code, character_id, image_url) values (2,10,'assets/images/hachani_2');
insert into status (code, character_id, image_url) values (3,10,'assets/images/hachani_3');
insert into status (code, character_id, image_url) values (4,10,'assets/images/hachani_4');
insert into status (code, character_id, image_url) values (5,10,'assets/images/hachani_5');
insert into status (code, character_id, image_url) values (6,10,'assets/images/hachani_6');

--퀘스쳔



insert into question(character_id, text) VALUES (8, '보사리 질문1');
insert into question(character_id, text) VALUES (8, '보사리 질문2');
insert into question(character_id, text) VALUES (8, '보사리 질문3');
insert into question(character_id, text) VALUES (8, '보사리 질문4');
insert into question(character_id, text) VALUES (8, '보사리 질문5');
insert into question(character_id, text) VALUES (8, '보사리 질문6');
insert into question(character_id, text) VALUES (8, '보사리 질문7');
insert into question(character_id, text) VALUES (8, '보사리 질문8');
insert into question(character_id, text) VALUES (8, '보사리 질문9');
insert into question(character_id, text) VALUES (8, '보사리 질문10');
insert into question(character_id, text) VALUES (8, '보사리 질문11');
insert into question(character_id, text) VALUES (8, '보사리 질문12');
insert into question(character_id, text) VALUES (8, '보사리 질문13');
insert into question(character_id, text) VALUES (8, '보사리 질문14');
insert into question(character_id, text) VALUES (8, '보사리 질문15');
insert into question(character_id, text) VALUES (8, '보사리 질문16');
insert into question(character_id, text) VALUES (8, '보사리 질문17');
insert into question(character_id, text) VALUES (8, '보사리 질문18');
insert into question(character_id, text) VALUES (8, '보사리 질문19');
insert into question(character_id, text) VALUES (8, '보사리 질문20');
insert into question(character_id, text) VALUES (8, '보사리 질문21');
insert into question(character_id, text) VALUES (8, '보사리 질문22');
insert into question(character_id, text) VALUES (8, '보사리 질문23');
insert into question(character_id, text) VALUES (8, '보사리 질문24');
insert into question(character_id, text) VALUES (8, '보사리 질문25');
insert into question(character_id, text) VALUES (8, '보사리 질문26');
insert into question(character_id, text) VALUES (8, '보사리 질문27');
insert into question(character_id, text) VALUES (8, '보사리 질문28');
insert into question(character_id, text) VALUES (8, '보사리 질문29');
insert into question(character_id, text) VALUES (8, '보사리 질문30');


insert into question(character_id, text) VALUES (3, '달콩이 질문1');
insert into question(character_id, text) VALUES (3, '달콩이 질문2');
insert into question(character_id, text) VALUES (3, '달콩이 질문3');
insert into question(character_id, text) VALUES (3, '달콩이 질문4');
insert into question(character_id, text) VALUES (3, '달콩이 질문5');
insert into question(character_id, text) VALUES (3, '달콩이 질문6');
insert into question(character_id, text) VALUES (3, '달콩이 질문7');
insert into question(character_id, text) VALUES (3, '달콩이 질문8');
insert into question(character_id, text) VALUES (3, '달콩이 질문9');
insert into question(character_id, text) VALUES (3, '달콩이 질문10');
insert into question(character_id, text) VALUES (3, '달콩이 질문11');
insert into question(character_id, text) VALUES (3, '달콩이 질문12');
insert into question(character_id, text) VALUES (3, '달콩이 질문13');
insert into question(character_id, text) VALUES (3, '달콩이 질문14');
insert into question(character_id, text) VALUES (3, '달콩이 질문15');
insert into question(character_id, text) VALUES (3, '달콩이 질문16');
insert into question(character_id, text) VALUES (3, '달콩이 질문17');
insert into question(character_id, text) VALUES (3, '달콩이 질문18');
insert into question(character_id, text) VALUES (3, '달콩이 질문19');
insert into question(character_id, text) VALUES (3, '달콩이 질문20');
insert into question(character_id, text) VALUES (3, '달콩이 질문21');
insert into question(character_id, text) VALUES (3, '달콩이 질문22');
insert into question(character_id, text) VALUES (3, '달콩이 질문23');
insert into question(character_id, text) VALUES (3, '달콩이 질문24');
insert into question(character_id, text) VALUES (3, '달콩이 질문25');
insert into question(character_id, text) VALUES (3, '달콩이 질문26');
insert into question(character_id, text) VALUES (3, '달콩이 질문27');
insert into question(character_id, text) VALUES (3, '달콩이 질문28');
insert into question(character_id, text) VALUES (3, '달콩이 질문29');
insert into question(character_id, text) VALUES (3, '달콩이 질문30');



insert into question(character_id, text) VALUES (7, '룰루 질문1');
insert into question(character_id, text) VALUES (7, '룰루 질문2');
insert into question(character_id, text) VALUES (7, '룰루 질문3');
insert into question(character_id, text) VALUES (7, '룰루 질문4');
insert into question(character_id, text) VALUES (7, '룰루 질문5');
insert into question(character_id, text) VALUES (7, '룰루 질문6');
insert into question(character_id, text) VALUES (7, '룰루 질문7');
insert into question(character_id, text) VALUES (7, '룰루 질문8');
insert into question(character_id, text) VALUES (7, '룰루 질문9');
insert into question(character_id, text) VALUES (7, '룰루 질문10');
insert into question(character_id, text) VALUES (7, '룰루 질문11');
insert into question(character_id, text) VALUES (7, '룰루 질문12');
insert into question(character_id, text) VALUES (7, '룰루 질문13');
insert into question(character_id, text) VALUES (7, '룰루 질문14');
insert into question(character_id, text) VALUES (7, '룰루 질문15');
insert into question(character_id, text) VALUES (7, '룰루 질문16');
insert into question(character_id, text) VALUES (7, '룰루 질문17');
insert into question(character_id, text) VALUES (7, '룰루 질문18');
insert into question(character_id, text) VALUES (7, '룰루 질문19');
insert into question(character_id, text) VALUES (7, '룰루 질문20');
insert into question(character_id, text) VALUES (7, '룰루 질문21');
insert into question(character_id, text) VALUES (7, '룰루 질문22');
insert into question(character_id, text) VALUES (7, '룰루 질문23');
insert into question(character_id, text) VALUES (7, '룰루 질문24');
insert into question(character_id, text) VALUES (7, '룰루 질문25');
insert into question(character_id, text) VALUES (7, '룰루 질문26');
insert into question(character_id, text) VALUES (7, '룰루 질문27');
insert into question(character_id, text) VALUES (7, '룰루 질문28');
insert into question(character_id, text) VALUES (7, '룰루 질문29');
insert into question(character_id, text) VALUES (7, '룰루 질문30');


insert into question(character_id, text) VALUES (4, '부우 질문1');
insert into question(character_id, text) VALUES (4, '부우 질문2');
insert into question(character_id, text) VALUES (4, '부우 질문3');
insert into question(character_id, text) VALUES (4, '부우 질문4');
insert into question(character_id, text) VALUES (4, '부우 질문5');
insert into question(character_id, text) VALUES (4, '부우 질문6');
insert into question(character_id, text) VALUES (4, '부우 질문7');
insert into question(character_id, text) VALUES (4, '부우 질문8');
insert into question(character_id, text) VALUES (4, '부우 질문9');
insert into question(character_id, text) VALUES (4, '부우 질문10');
insert into question(character_id, text) VALUES (4, '부우 질문11');
insert into question(character_id, text) VALUES (4, '부우 질문12');
insert into question(character_id, text) VALUES (4, '부우 질문13');
insert into question(character_id, text) VALUES (4, '부우 질문14');
insert into question(character_id, text) VALUES (4, '부우 질문15');
insert into question(character_id, text) VALUES (4, '부우 질문16');
insert into question(character_id, text) VALUES (4, '부우 질문17');
insert into question(character_id, text) VALUES (4, '부우 질문18');
insert into question(character_id, text) VALUES (4, '부우 질문19');
insert into question(character_id, text) VALUES (4, '부우 질문20');
insert into question(character_id, text) VALUES (4, '부우 질문21');
insert into question(character_id, text) VALUES (4, '부우 질문22');
insert into question(character_id, text) VALUES (4, '부우 질문23');
insert into question(character_id, text) VALUES (4, '부우 질문24');
insert into question(character_id, text) VALUES (4, '부우 질문25');
insert into question(character_id, text) VALUES (4, '부우 질문26');
insert into question(character_id, text) VALUES (4, '부우 질문27');
insert into question(character_id, text) VALUES (4, '부우 질문28');
insert into question(character_id, text) VALUES (4, '부우 질문29');
insert into question(character_id, text) VALUES (4, '부우 질문30');



insert into question(character_id, text) VALUES (6, '식타미 질문1');
insert into question(character_id, text) VALUES (6, '식타미 질문2');
insert into question(character_id, text) VALUES (6, '식타미 질문3');
insert into question(character_id, text) VALUES (6, '식타미 질문4');
insert into question(character_id, text) VALUES (6, '식타미 질문5');
insert into question(character_id, text) VALUES (6, '식타미 질문6');
insert into question(character_id, text) VALUES (6, '식타미 질문7');
insert into question(character_id, text) VALUES (6, '식타미 질문8');
insert into question(character_id, text) VALUES (6, '식타미 질문9');
insert into question(character_id, text) VALUES (6, '식타미 질문10');
insert into question(character_id, text) VALUES (6, '식타미 질문11');
insert into question(character_id, text) VALUES (6, '식타미 질문12');
insert into question(character_id, text) VALUES (6, '식타미 질문13');
insert into question(character_id, text) VALUES (6, '식타미 질문14');
insert into question(character_id, text) VALUES (6, '식타미 질문15');
insert into question(character_id, text) VALUES (6, '식타미 질문16');
insert into question(character_id, text) VALUES (6, '식타미 질문17');
insert into question(character_id, text) VALUES (6, '식타미 질문18');
insert into question(character_id, text) VALUES (6, '식타미 질문19');
insert into question(character_id, text) VALUES (6, '식타미 질문20');
insert into question(character_id, text) VALUES (6, '식타미 질문21');
insert into question(character_id, text) VALUES (6, '식타미 질문22');
insert into question(character_id, text) VALUES (6, '식타미 질문23');
insert into question(character_id, text) VALUES (6, '식타미 질문24');
insert into question(character_id, text) VALUES (6, '식타미 질문25');
insert into question(character_id, text) VALUES (6, '식타미 질문26');
insert into question(character_id, text) VALUES (6, '식타미 질문27');
insert into question(character_id, text) VALUES (6, '식타미 질문28');
insert into question(character_id, text) VALUES (6, '식타미 질문29');
insert into question(character_id, text) VALUES (6, '식타미 질문30');



insert into question(character_id, text) VALUES (10, '하차니 질문1');
insert into question(character_id, text) VALUES (10, '하차니 질문2');
insert into question(character_id, text) VALUES (10, '하차니 질문3');
insert into question(character_id, text) VALUES (10, '하차니 질문4');
insert into question(character_id, text) VALUES (10, '하차니 질문5');
insert into question(character_id, text) VALUES (10, '하차니 질문6');
insert into question(character_id, text) VALUES (10, '하차니 질문7');
insert into question(character_id, text) VALUES (10, '하차니 질문8');
insert into question(character_id, text) VALUES (10, '하차니 질문9');
insert into question(character_id, text) VALUES (10, '하차니 질문10');
insert into question(character_id, text) VALUES (10, '하차니 질문11');
insert into question(character_id, text) VALUES (10, '하차니 질문12');
insert into question(character_id, text) VALUES (10, '하차니 질문13');
insert into question(character_id, text) VALUES (10, '하차니 질문14');
insert into question(character_id, text) VALUES (10, '하차니 질문15');
insert into question(character_id, text) VALUES (10, '하차니 질문16');
insert into question(character_id, text) VALUES (10, '하차니 질문17');
insert into question(character_id, text) VALUES (10, '하차니 질문18');
insert into question(character_id, text) VALUES (10, '하차니 질문19');
insert into question(character_id, text) VALUES (10, '하차니 질문20');
insert into question(character_id, text) VALUES (10, '하차니 질문21');
insert into question(character_id, text) VALUES (10, '하차니 질문22');
insert into question(character_id, text) VALUES (10, '하차니 질문23');
insert into question(character_id, text) VALUES (10, '하차니 질문24');
insert into question(character_id, text) VALUES (10, '하차니 질문25');
insert into question(character_id, text) VALUES (10, '하차니 질문26');
insert into question(character_id, text) VALUES (10, '하차니 질문27');
insert into question(character_id, text) VALUES (10, '하차니 질문28');
insert into question(character_id, text) VALUES (10, '하차니 질문29');
insert into question(character_id, text) VALUES (10, '하차니 질문30');



insert into question(character_id, text) VALUES (5, '상상이 질문1');
insert into question(character_id, text) VALUES (5, '상상이 질문2');
insert into question(character_id, text) VALUES (5, '상상이 질문3');
insert into question(character_id, text) VALUES (5, '상상이 질문4');
insert into question(character_id, text) VALUES (5, '상상이 질문5');
insert into question(character_id, text) VALUES (5, '상상이 질문6');
insert into question(character_id, text) VALUES (5, '상상이 질문7');
insert into question(character_id, text) VALUES (5, '상상이 질문8');
insert into question(character_id, text) VALUES (5, '상상이 질문9');
insert into question(character_id, text) VALUES (5, '상상이 질문10');
insert into question(character_id, text) VALUES (5, '상상이 질문11');
insert into question(character_id, text) VALUES (5, '상상이 질문12');
insert into question(character_id, text) VALUES (5, '상상이 질문13');
insert into question(character_id, text) VALUES (5, '상상이 질문14');
insert into question(character_id, text) VALUES (5, '상상이 질문15');
insert into question(character_id, text) VALUES (5, '상상이 질문16');
insert into question(character_id, text) VALUES (5, '상상이 질문17');
insert into question(character_id, text) VALUES (5, '상상이 질문18');
insert into question(character_id, text) VALUES (5, '상상이 질문19');
insert into question(character_id, text) VALUES (5, '상상이 질문20');
insert into question(character_id, text) VALUES (5, '상상이 질문21');
insert into question(character_id, text) VALUES (5, '상상이 질문22');
insert into question(character_id, text) VALUES (5, '상상이 질문23');
insert into question(character_id, text) VALUES (5, '상상이 질문24');
insert into question(character_id, text) VALUES (5, '상상이 질문25');
insert into question(character_id, text) VALUES (5, '상상이 질문26');
insert into question(character_id, text) VALUES (5, '상상이 질문27');
insert into question(character_id, text) VALUES (5, '상상이 질문28');
insert into question(character_id, text) VALUES (5, '상상이 질문29');
insert into question(character_id, text) VALUES (5, '상상이 질문30');
이


insert into question(character_id, text) VALUES (9, '팩폭이 질문1');
insert into question(character_id, text) VALUES (9, '팩폭이 질문2');
insert into question(character_id, text) VALUES (9, '팩폭이 질문3');
insert into question(character_id, text) VALUES (9, '팩폭이 질문4');
insert into question(character_id, text) VALUES (9, '팩폭이 질문5');
insert into question(character_id, text) VALUES (9, '팩폭이 질문6');
insert into question(character_id, text) VALUES (9, '팩폭이 질문7');
insert into question(character_id, text) VALUES (9, '팩폭이 질문8');
insert into question(character_id, text) VALUES (9, '팩폭이 질문9');
insert into question(character_id, text) VALUES (9, '팩폭이 질문10');
insert into question(character_id, text) VALUES (9, '팩폭이 질문11');
insert into question(character_id, text) VALUES (9, '팩폭이 질문12');
insert into question(character_id, text) VALUES (9, '팩폭이 질문13');
insert into question(character_id, text) VALUES (9, '팩폭이 질문14');
insert into question(character_id, text) VALUES (9, '팩폭이 질문15');
insert into question(character_id, text) VALUES (9, '팩폭이 질문16');
insert into question(character_id, text) VALUES (9, '팩폭이 질문17');
insert into question(character_id, text) VALUES (9, '팩폭이 질문18');
insert into question(character_id, text) VALUES (9, '팩폭이 질문19');
insert into question(character_id, text) VALUES (9, '팩폭이 질문20');
insert into question(character_id, text) VALUES (9, '팩폭이 질문21');
insert into question(character_id, text) VALUES (9, '팩폭이 질문22');
insert into question(character_id, text) VALUES (9, '팩폭이 질문23');
insert into question(character_id, text) VALUES (9, '팩폭이 질문24');
insert into question(character_id, text) VALUES (9, '팩폭이 질문25');
insert into question(character_id, text) VALUES (9, '팩폭이 질문26');
insert into question(character_id, text) VALUES (9, '팩폭이 질문27');
insert into question(character_id, text) VALUES (9, '팩폭이 질문28');
insert into question(character_id, text) VALUES (9, '팩폭이 질문29');
insert into question(character_id, text) VALUES (9, '팩폭이 질문30');



insert into question(character_id, text) VALUES (1, '뭉그리 질문1');
insert into question(character_id, text) VALUES (1, '뭉그리 질문2');
insert into question(character_id, text) VALUES (1, '뭉그리 질문3');
insert into question(character_id, text) VALUES (1, '뭉그리 질문4');
insert into question(character_id, text) VALUES (1, '뭉그리 질문5');
insert into question(character_id, text) VALUES (1, '뭉그리 질문6');
insert into question(character_id, text) VALUES (1, '뭉그리 질문7');
insert into question(character_id, text) VALUES (1, '뭉그리 질문8');
insert into question(character_id, text) VALUES (1, '뭉그리 질문9');
insert into question(character_id, text) VALUES (1, '뭉그리 질문10');
insert into question(character_id, text) VALUES (1, '뭉그리 질문11');
insert into question(character_id, text) VALUES (1, '뭉그리 질문12');
insert into question(character_id, text) VALUES (1, '뭉그리 질문13');
insert into question(character_id, text) VALUES (1, '뭉그리 질문14');
insert into question(character_id, text) VALUES (1, '뭉그리 질문15');
insert into question(character_id, text) VALUES (1, '뭉그리 질문16');
insert into question(character_id, text) VALUES (1, '뭉그리 질문17');
insert into question(character_id, text) VALUES (1, '뭉그리 질문18');
insert into question(character_id, text) VALUES (1, '뭉그리 질문19');
insert into question(character_id, text) VALUES (1, '뭉그리 질문20');
insert into question(character_id, text) VALUES (1, '뭉그리 질문21');
insert into question(character_id, text) VALUES (1, '뭉그리 질문22');
insert into question(character_id, text) VALUES (1, '뭉그리 질문23');
insert into question(character_id, text) VALUES (1, '뭉그리 질문24');
insert into question(character_id, text) VALUES (1, '뭉그리 질문25');
insert into question(character_id, text) VALUES (1, '뭉그리 질문26');
insert into question(character_id, text) VALUES (1, '뭉그리 질문27');
insert into question(character_id, text) VALUES (1, '뭉그리 질문28');
insert into question(character_id, text) VALUES (1, '뭉그리 질문29');
insert into question(character_id, text) VALUES (1, '뭉그리 질문30');


insert into question(character_id, text) VALUES (2, '똘똘이 질문1');
insert into question(character_id, text) VALUES (2, '똘똘이 질문2');
insert into question(character_id, text) VALUES (2, '똘똘이 질문3');
insert into question(character_id, text) VALUES (2, '똘똘이 질문4');
insert into question(character_id, text) VALUES (2, '똘똘이 질문5');
insert into question(character_id, text) VALUES (2, '똘똘이 질문6');
insert into question(character_id, text) VALUES (2, '똘똘이 질문7');
insert into question(character_id, text) VALUES (2, '똘똘이 질문8');
insert into question(character_id, text) VALUES (2, '똘똘이 질문9');
insert into question(character_id, text) VALUES (2, '똘똘이 질문10');
insert into question(character_id, text) VALUES (2, '똘똘이 질문11');
insert into question(character_id, text) VALUES (2, '똘똘이 질문12');
insert into question(character_id, text) VALUES (2, '똘똘이 질문13');
insert into question(character_id, text) VALUES (2, '똘똘이 질문14');
insert into question(character_id, text) VALUES (2, '똘똘이 질문15');
insert into question(character_id, text) VALUES (2, '똘똘이 질문16');
insert into question(character_id, text) VALUES (2, '똘똘이 질문17');
insert into question(character_id, text) VALUES (2, '똘똘이 질문18');
insert into question(character_id, text) VALUES (2, '똘똘이 질문19');
insert into question(character_id, text) VALUES (2, '똘똘이 질문20');
insert into question(character_id, text) VALUES (2, '똘똘이 질문21');
insert into question(character_id, text) VALUES (2, '똘똘이 질문22');
insert into question(character_id, text) VALUES (2, '똘똘이 질문23');
insert into question(character_id, text) VALUES (2, '똘똘이 질문24');
insert into question(character_id, text) VALUES (2, '똘똘이 질문25');
insert into question(character_id, text) VALUES (2, '똘똘이 질문26');
insert into question(character_id, text) VALUES (2, '똘똘이 질문27');
insert into question(character_id, text) VALUES (2, '똘똘이 질문28');
insert into question(character_id, text) VALUES (2, '똘똘이 질문29');
insert into question(character_id, text) VALUES (2, '똘똘이 질문30');
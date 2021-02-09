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



insert into question(character_id, text) VALUES (8, '오늘 가족이랑은 무슨 대화를 했어?');
insert into question(character_id, text) VALUES (8, '친한 친구와의 가장 기억에 남는 추억은?');
insert into question(character_id, text) VALUES (8, '친해지고 싶은 사람 있었어?\n왜 친해지고 싶었어?');
insert into question(character_id, text) VALUES (8, '오늘 다른 사람과의 거리감은 어땠어?');
insert into question(character_id, text) VALUES (8, '오늘 나는 주변 사람들에게\n표현을 많이 하는 사람이었어?');
insert into question(character_id, text) VALUES (8, '만나고 싶지 않은 사람은 있었어?');
insert into question(character_id, text) VALUES (8, '친구, 가족, 회사, 학교 등의\n집단마다 나는 다른 성향이야?');
insert into question(character_id, text) VALUES (8, '이성 친구와 동성 친구\n어느 쪽을 중시하는 편이야?');
insert into question(character_id, text) VALUES (8, '친구들과 있을 때 어떤 주제를 주로 말해?');
insert into question(character_id, text) VALUES (8, '나를 많이 생각해주는 사람들을\n만날 기회가 있었어?');
insert into question(character_id, text) VALUES (8, '말없이 같이 있어도 편한 친구는 있었어?');
insert into question(character_id, text) VALUES (8, '가족과 하고 싶은 이야기가 있어?');
insert into question(character_id, text) VALUES (8, '대화하기 편한 상대는 어떤 타입이야?');
insert into question(character_id, text) VALUES (8, '친구들 사이에서 나는 어떤 사람일까?');
insert into question(character_id, text) VALUES (8, '가장 오래 같이 있고 싶은 사람은 누구였어?');
insert into question(character_id, text) VALUES (8, '친구들은 내 어떤 점을 좋아해 줄까?');
insert into question(character_id, text) VALUES (8, '인간관계의 진전을 내 의지로만 이룰 수 있을까?');
insert into question(character_id, text) VALUES (8, '관계가 틀어졌을 때, 가장 힘들 것 같은 친구는 누구야?');
insert into question(character_id, text) VALUES (8, '가장 그리워하는 사람은 누구야?');
insert into question(character_id, text) VALUES (8, '내가 소중히 여기는 사람들도\n나를 소중히 대해주는 것 같아?');
insert into question(character_id, text) VALUES (8, '내게 잘해주지만 귀찮은 친구라고\n느낄 때, 어떻게 행동해?');
insert into question(character_id, text) VALUES (8, '친구와 거리감을 느낄 때가 있어?');
insert into question(character_id, text) VALUES (8, '당연하게 내 곁에 계시던 부모님께서\n떠난다는 생각을 해봤어?');
insert into question(character_id, text) VALUES (8, '내가 사라지면 부모님은 어떻게 반응할까?');
insert into question(character_id, text) VALUES (8, '만나면 항상 같은 주제를 얘기하는 사람이 있어?');
insert into question(character_id, text) VALUES (8, '몇 년 만에 만나도 어색하지 않은 사람이 있을까?');
insert into question(character_id, text) VALUES (8, '자신의 할 말만 하는 사람에게는 어떻게 대응해?');
insert into question(character_id, text) VALUES (8, '처음 보는 사람과 주로 친해지는 방식은 뭐야?');
insert into question(character_id, text) VALUES (8, '널 필요할 때만 찾는 친구가 있어?');
insert into question(character_id, text) VALUES (8, '가족이어도 지켜야 하는 부분들이 있다고 생각해?');


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


insert into question(character_id, text) VALUES (4, '오늘 만난 싫어하는 타입의 사람은 누구야?');
insert into question(character_id, text) VALUES (4, '무례한 사람에게 하고 싶은 말이 있었어?');
insert into question(character_id, text) VALUES (4, '나를 화나게 하는 일이 있었어?');
insert into question(character_id, text) VALUES (4, '단점을 알게 된 사람이 있었어?');
insert into question(character_id, text) VALUES (4, '내 평정심을 무너뜨리는 사람은 어떤 사람이야?');
insert into question(character_id, text) VALUES (4, '선을 넘는 사람에게 가장 해주고 싶은 말은?');
insert into question(character_id, text) VALUES (4, '시간을 돌릴 수 있다면\n돌려버리고 싶은 일이 있었어?');
insert into question(character_id, text) VALUES (4, '싫어하는 일은 어떤 점이 가장 싫었어?');
insert into question(character_id, text) VALUES (4, '왜 나에게만 이런 일이 했던 적이 있었어?');
insert into question(character_id, text) VALUES (4, '현명하게 화내는 건 어떤 모습이라고 생각해?');
insert into question(character_id, text) VALUES (4, '나를 부정적 감정으로 몰아넣은\n사람이나 사건이 있었어?');
insert into question(character_id, text) VALUES (4, '최근 가장 안 좋았던 일은 뭐야?');
insert into question(character_id, text) VALUES (4, '나의 믿음을 배신한 사건이 있었어?');
insert into question(character_id, text) VALUES (4, '때려치우고 싶지만 그럴 수 없는 일이 있었어?');
insert into question(character_id, text) VALUES (4, '싫어하는 사람의 어떤 점이 가장 싫었어?');
insert into question(character_id, text) VALUES (4, '만나면 이성 얘기만 하는 사람이 있어?');
insert into question(character_id, text) VALUES (4, '아무 이유 없이 미움받은 적이 있어?');
insert into question(character_id, text) VALUES (4, '세상에서 가장 한심하다고 생각하는 일은 뭐야?');
insert into question(character_id, text) VALUES (4, '감정을 자제하지 못하는 사람들을 만난 적이 있어?');
insert into question(character_id, text) VALUES (4, '같이 있으면 기분이 안 좋은 사람이 있어?');
insert into question(character_id, text) VALUES (4, '감정 휴지통이 된 것 같다고 느낀 적이 있어?');
insert into question(character_id, text) VALUES (4, '제대로 대처하지 못한 부당한 일을 겪은 적이 있어?');
insert into question(character_id, text) VALUES (4, '나를 힘들게 하는 집단의 규칙, 규율들은 어떤 거야?');
insert into question(character_id, text) VALUES (4, '내 옆에 붙어 자존감을 깎는 사람이 있어?');
insert into question(character_id, text) VALUES (4, '너에게 엄격한 잣대를 들이대는 사람이 있어?');
insert into question(character_id, text) VALUES (4, '비꼬는 말투를 가진 사람에게는 어떻게 대응해?');
insert into question(character_id, text) VALUES (4, '다른 사람을 무시하며 자신을\n추켜세우는 사람을 만난 적이 있어?');
insert into question(character_id, text) VALUES (4, '출발선이 다른 사람에게 화가 났던 적이 있어?');
insert into question(character_id, text) VALUES (4, '제일 재수 없는 유형의 사람은 어떤 사람이야?');
insert into question(character_id, text) VALUES (4, '데스노트에 적고 싶은 사람은?');



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



insert into question(character_id, text) VALUES (1, '오늘 한 말 중에 가장 후회되는 말이 뭐야?');
insert into question(character_id, text) VALUES (1, '오늘 결정한 일 중에 후회됐던 것 있어?');
insert into question(character_id, text) VALUES (1, '조금만 더 놓지 않고 싶었던 일이 있었어?');
insert into question(character_id, text) VALUES (1, '내일 잘 해내지 못할 것 같은\n불안한 일이 있어?');
insert into question(character_id, text) VALUES (1, '내가 상처 줬던 사람이 있어?');
insert into question(character_id, text) VALUES (1, '후회하지 않는 일은 있었어?');
insert into question(character_id, text) VALUES (1, '전혀 걱정되지 않는 일이 있다면,\n이유가 뭘까?');
insert into question(character_id, text) VALUES (1, '오늘 자기 전에\n계속 생각날 것 같은 일은 뭐야?');
insert into question(character_id, text) VALUES (1, '후회되는 일이 있다면,\n어떻게 고쳐나갈 수 있을까?');
insert into question(character_id, text) VALUES (1, '지금 가장 신경 쓰는 일의 최악의 상황은 무엇일까?');
insert into question(character_id, text) VALUES (1, '지금 나를 불안하게 만드는\n근본적인 이유는 뭘까?');
insert into question(character_id, text) VALUES (1, '항상 그립고 생각나는 사람이 있어?');
insert into question(character_id, text) VALUES (1, '책임이 막중한 일을 맡은 적이 있어?');
insert into question(character_id, text) VALUES (1, '더 잘할 수 있었을 텐데 라고\n생각되는 일이 있어?');
insert into question(character_id, text) VALUES (1, '신경 쓰이고 걱정되는 사람이 있었어?');
insert into question(character_id, text) VALUES (1, '미련과 여지를 남겨서 힘들었던 적이 있어?');
insert into question(character_id, text) VALUES (1, '과거의 일 때문에\n아직 망설여지는 일이 있다면?');
insert into question(character_id, text) VALUES (1, '인생에서 가장 걱정되는 일이 뭐야?');
insert into question(character_id, text) VALUES (1, '가장 행복했던 시절은 어땠어?');
insert into question(character_id, text) VALUES (1, '하고 싶었지만 안 했거나 못했던 일이 있어?');
insert into question(character_id, text) VALUES (1, '나에 대한 기대 때문에 걱정되는 점이 있어?');
insert into question(character_id, text) VALUES (1, '시작하기 무서워 망설이고 있는 일이 있어?');
insert into question(character_id, text) VALUES (1, '무심코 뱉은 말에 다른 사람을\n상처입힌 적이 있어?');
insert into question(character_id, text) VALUES (1, '사람에게 크게 상처받았던 기억이 있어?');
insert into question(character_id, text) VALUES (1, '선의의 행동이 안 좋은 결과로 나타난 적이 있어?');
insert into question(character_id, text) VALUES (1, '항상 저지르고 후회하는 것을 반복하는 습관이 있어?');
insert into question(character_id, text) VALUES (1, '일상적으로 가지고 있는 걱정거리가 있어?');
insert into question(character_id, text) VALUES (1, '가장 후회되는 일에서\n대처를 더 잘했다면 지금과 달라졌을까?');
insert into question(character_id, text) VALUES (1, '요즘 자꾸 신경 쓰이는 일이 있어?');
insert into question(character_id, text) VALUES (1, '다른 사람들이 나에 대해 말하는 것 중에\n어떤 게 가장 신경이 쓰여?');


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
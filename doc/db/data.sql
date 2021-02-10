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
insert into character(id, name, color, face_url, description) values (1,'뭉그리' ,  0xFF0061fa, 'assets/images/face_worry'  , '안녕? 내 이름은 뭉그리!'|| char(10) ||'질척질척 남겨두고 있던 과거의'|| char(10) ||'미련은 나에게 버려줘!');
insert into character(id, name, color, face_url, description) values (2,'똘똘이',  0xFF3BE3FF,  'assets/images/face_future'  ,'안녕? 내 이름은 똘똘이!'|| char(10) ||'미래를 어떻게 계획하면 좋을까?'|| char(10) ||'나랑 같이 이야기해보자.');
insert into character(id, name, color, face_url, description) values (3,'달콩이' ,  0xFFff0084, 'assets/images/face_love'  , '안녕? 내 이름은 달콩이!'|| char(10) ||'난 다른 사람들의 사랑 이야기를'|| char(10) ||'엄청! 엄청! 좋아해');
insert into character(id, name, color, face_url, description) values (4,'부우'  ,  0xFFef0033, 'assets/images/face_angry'  , '안녕? 내 이름은 부우!'|| char(10) ||'세상에는 왜 이렇게 화날 일들이 많은지!'|| char(10) ||'내가 화나는 이야기 다 들어줄게!');
insert into character(id, name, color, face_url, description) values (5,'상상이' ,  0xFFff9f00, 'assets/images/face_imagine'  , '안녕? 내 이름은 상상이!'|| char(10) ||'나와 함께라면 되고 싶은 것 무엇이든'|| char(10) ||'상상해 볼 수 있다고!');
insert into character(id, name, color, face_url, description) values (6,'식타미' ,  0xFFfc5c00, 'assets/images/face_food'  , '안녕? 내 이름은 식타미!'|| char(10) ||'나는 음식 이야기를 엄청 좋아해!'|| char(10) ||'너도 먹는 거 좋아하니?');
insert into character(id, name, color, face_url, description) values (7,'룰루'  ,  0xFFffd817, 'assets/images/face_hobby'  , '안녕? 내 이름은 룰루!'|| char(10) ||'나는 엄청 다양한 취미를 가지고 있어!'|| char(10) ||'넌 어떤 취미가 있니?');
insert into character(id, name, color, face_url, description) values (8,'보사리' ,  0xFF56e556, 'assets/images/face_people'  , '안녕? 내 이름은 보사리!'|| char(10) ||'인간관계란 누구라도 어려운 문제지.'|| char(10) ||'하.하.하.하.하');
insert into character(id, name, color, face_url, description) values (9,'팩폭이' ,  0xFF69b70c, 'assets/images/face_fact'  , '안녕? 내 이름은 팩폭이!'|| char(10) ||'인생의 쓴맛을 가감 없이 알려줄게!'|| char(10) ||'자아성찰은 중요하다고!');
insert into character(id, name, color, face_url, description) values (10,'하차니' ,  0xFF760de9, 'assets/images/face_hachani'  , '안녕? 내 이름은 하차니!'|| char(10) ||'작지만 소중한 일상 이야기는'|| char(10) ||'삶의 원동력이지~!');

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

-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (8, '오늘 가족이랑은 무슨 대화를 했어?');
insert into question(character_id, text) VALUES (8, '친한 친구와의 가장 기억에 남는 추억은?');
insert into question(character_id, text) VALUES (8, '친해지고 싶은 사람 있었어? 왜 친해지고 싶었어?');
insert into question(character_id, text) VALUES (8, '오늘 다른 사람과의 거리감은 어땠어?');
insert into question(character_id, text) VALUES (8, '오늘 나는 주변 사람들에게 표현을 많이 하는 사람이었어?');
insert into question(character_id, text) VALUES (8, '만나고 싶지 않은 사람은 있었어?');
insert into question(character_id, text) VALUES (8, '친구, 가족, 회사, 학교 등의 집단마다 나는 다른 성향이야?');
insert into question(character_id, text) VALUES (8, '이성 친구와 동성 친구 어느 쪽을 중시하는 편이야?');
insert into question(character_id, text) VALUES (8, '친구들과 있을 때 어떤 주제를 주로 말해?');
insert into question(character_id, text) VALUES (8, '나를 많이 생각해주는 사람들을 만날 기회가 있었어?');
insert into question(character_id, text) VALUES (8, '말없이 같이 있어도 편한 친구는 있었어?');
insert into question(character_id, text) VALUES (8, '가족과 하고 싶은 이야기가 있어?');
insert into question(character_id, text) VALUES (8, '대화하기 편한 상대는 어떤 타입이야?');
insert into question(character_id, text) VALUES (8, '친구들 사이에서 나는 어떤 사람일까?');
insert into question(character_id, text) VALUES (8, '가장 오래 같이 있고 싶은 사람은 누구였어?');
insert into question(character_id, text) VALUES (8, '친구들은 내 어떤 점을 좋아해 줄까?');
insert into question(character_id, text) VALUES (8, '인간관계의 진전을 내 의지로만 이룰 수 있을까?');
insert into question(character_id, text) VALUES (8, '관계가 틀어졌을 때, 가장 힘들 것 같은 친구는 누구야?');
insert into question(character_id, text) VALUES (8, '가장 그리워하는 사람은 누구야?');
insert into question(character_id, text) VALUES (8, '내가 소중히 여기는 사람들도 나를 소중히 대해주는 것 같아?');
insert into question(character_id, text) VALUES (8, '내게 잘해주지만 귀찮은 친구라고 느낄 때, 어떻게 행동해?');
insert into question(character_id, text) VALUES (8, '친구와 거리감을 느낄 때가 있어?');
insert into question(character_id, text) VALUES (8, '당연하게 내 곁에 계시던 부모님께서 떠난다는 생각을 해봤어?');
insert into question(character_id, text) VALUES (8, '내가 사라지면 부모님은 어떻게 반응할까?');
insert into question(character_id, text) VALUES (8, '만나면 항상 같은 주제를 얘기하는 사람이 있어?');
insert into question(character_id, text) VALUES (8, '몇 년 만에 만나도 어색하지 않은 사람이 있을까?');
insert into question(character_id, text) VALUES (8, '자신의 할 말만 하는 사람에게는 어떻게 대응해?');
insert into question(character_id, text) VALUES (8, '처음 보는 사람과 주로 친해지는 방식은 뭐야?');
insert into question(character_id, text) VALUES (8, '널 필요할 때만 찾는 친구가 있어?');
insert into question(character_id, text) VALUES (8, '가족이어도 지켜야 하는 부분들이 있다고 생각해?');
-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (3, '너의 첫사랑은 어떤 사람이야?');
insert into question(character_id, text) VALUES (3, '너의 이상형은 어떤 사람이야?');
insert into question(character_id, text) VALUES (3, '내가 사랑하는 사람이 좋아 아니면 나를 사랑해주는 사람이 좋아?');
insert into question(character_id, text) VALUES (3, '이성끼리 친구가 가능할까?');
insert into question(character_id, text) VALUES (3, '너가 가장 자랑스러울 때는 언제야?');
insert into question(character_id, text) VALUES (3, '제일 사랑하는 사람은 어떤 사람이야?');
insert into question(character_id, text) VALUES (3, '''부모님의 사랑''하면 뭐가 떠올라?');
insert into question(character_id, text) VALUES (3, '다른 사람을 용서해본 적 있어?');
insert into question(character_id, text) VALUES (3, '기억에 남는 고백 있어?');
insert into question(character_id, text) VALUES (3, '친구와의 우정에서 가장 중요하다고 생각하는 것은 뭐야?');
insert into question(character_id, text) VALUES (3, '가장 소중한 기억이 뭐야?');
insert into question(character_id, text) VALUES (3, '너는 사랑하면 무엇이 떠올라?');
insert into question(character_id, text) VALUES (3, '너의 최애 카페음료는 뭐야? 왜 그 음료를 선택했어?');
insert into question(character_id, text) VALUES (3, '너는 어떤 사람과 결혼하고 싶어?');
insert into question(character_id, text) VALUES (3, '사랑에 관해 어떤 가치관을 가지고 있어?');
insert into question(character_id, text) VALUES (3, '기억에 남는 사랑하는 사람이 있니?');
insert into question(character_id, text) VALUES (3, '''친구 우정''하면 뭐가 떠올라?');
insert into question(character_id, text) VALUES (3, '사랑하게 되면 어떤 부분이 닮아질까?');
insert into question(character_id, text) VALUES (3, '기억에 남는 로맨틱한 순간이 있어?');
insert into question(character_id, text) VALUES (3, '기억에 남는 편안하고 좋은 순간들은 언제야?');
insert into question(character_id, text) VALUES (3, '너는 애인에게 어떤 사람이 되고 싶어?');
insert into question(character_id, text) VALUES (3, 'cc나 사내 연애에 대한 로망이 있어? 어떻게 생각해?');
insert into question(character_id, text) VALUES (3, '가장 사랑하는 연예인은 누구야?');
insert into question(character_id, text) VALUES (3, '스스로를 사랑하는 인생은 어떤 것이라고 생각해?');
insert into question(character_id, text) VALUES (3, '너는 어떤 사람과 연애하고 싶어?');
insert into question(character_id, text) VALUES (3, '''사랑''하면 떠오르는 사람이 있어?');
insert into question(character_id, text) VALUES (3, '좋아하는 것과 사랑하는 것은 어떤 차이가 있을까?');
insert into question(character_id, text) VALUES (3, '연애를 하면 좋은 점이 무엇이 있을까?');
insert into question(character_id, text) VALUES (3, '먼저 마음을 고백할만큼 좋아했던 사람이 있어?');
insert into question(character_id, text) VALUES (3, '사랑하는 사람과 가고 싶은 곳이 있어?');

-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (7, '인상 깊게 본 영화는 뭐야?');
insert into question(character_id, text) VALUES (7, '최근 너의 취미는 뭐야?');
insert into question(character_id, text) VALUES (7, '가장 인상깊은 책은 뭐야?');
insert into question(character_id, text) VALUES (7, '어떤 게임을 가장 좋아해?');
insert into question(character_id, text) VALUES (7, '누구랑 취미생활 하는 거 좋아해?');
insert into question(character_id, text) VALUES (7, '과거의 너의 취미는 뭐야?');
insert into question(character_id, text) VALUES (7, '어떤 음악 듣는 거 좋아해?');
insert into question(character_id, text) VALUES (7, '잊고 있었던 너의 취미는 뭐야?');
insert into question(character_id, text) VALUES (7, 'SNS 좋아해? 하게 된 계기는 뭐야? 안한다면 왜 안해?');
insert into question(character_id, text) VALUES (7, '좋아하는 취미 분야의 유투버가 있어?');
insert into question(character_id, text) VALUES (7, '집에서 영화보는게 좋아? 영화관에서 영화보는게 좋아?');
insert into question(character_id, text) VALUES (7, '긴 휴가가 주어진다면, 뭘 할거야?');
insert into question(character_id, text) VALUES (7, '바다 여행에 관한 추억이 있어?');
insert into question(character_id, text) VALUES (7, '캠핑이나 등산에 관한 추억이 있어?');
insert into question(character_id, text) VALUES (7, '가족 여행에 관한 추억이 있어?');
insert into question(character_id, text) VALUES (7, '너는 집돌이야? 집순이야?');
insert into question(character_id, text) VALUES (7, '한 달 동안 외국에서 살아야 한다면 가고 싶은 나라는?');
insert into question(character_id, text) VALUES (7, '좋아하는 tv 프로그램 있어? 왜 좋아해?');
insert into question(character_id, text) VALUES (7, '새로운 친구를 사귄다면 어떤 취미의 사람들을 만나고 싶어?');
insert into question(character_id, text) VALUES (7, '꼭 해보고 싶은 취미 활동이 있을까?');
insert into question(character_id, text) VALUES (7, '무언가를 수집하고 있거나 모아보고 싶은 게 있어?');
insert into question(character_id, text) VALUES (7, '어떤 취미 활동에 푹 빠져본 적 있어? 어떤 취미였어?');
insert into question(character_id, text) VALUES (7, '''자유여행 VS 패키지 여행'' 당신의 선택은?');
insert into question(character_id, text) VALUES (7, '나만의 여가 생활을 만들기 위해 어떤 노력을 했어?');
insert into question(character_id, text) VALUES (7, '같이 취미 활동하는 데 잘 맞을 것 같은 친구 유형은?');
insert into question(character_id, text) VALUES (7, '기억에 남는 축제가 있어?');
insert into question(character_id, text) VALUES (7, '나는 친구들과 카페에서 수다 떨면 스트레스가 풀리더라~ 너는?');
insert into question(character_id, text) VALUES (7, '하면 할수록 좋아지는 취미가 있어?');
insert into question(character_id, text) VALUES (7, '친구와 함께 하는 여행을 가본 적 있어?');
insert into question(character_id, text) VALUES (7, '주변에 특별한 취미를 가진 사람이 있어? 어떤거야?');
-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (4, '오늘 만난 싫어하는 타입의 사람은 누구야?');
insert into question(character_id, text) VALUES (4, '무례한 사람에게 하고 싶은 말이 있었어?');
insert into question(character_id, text) VALUES (4, '나를 화나게 하는 일이 있었어?');
insert into question(character_id, text) VALUES (4, '단점을 알게 된 사람이 있었어?');
insert into question(character_id, text) VALUES (4, '내 평정심을 무너뜨리는 사람은 어떤 사람이야?');
insert into question(character_id, text) VALUES (4, '선을 넘는 사람에게 가장 해주고 싶은 말은?');
insert into question(character_id, text) VALUES (4, '시간을 돌릴 수 있다면 돌려버리고 싶은 일이 있었어?');
insert into question(character_id, text) VALUES (4, '싫어하는 일은 어떤 점이 가장 싫었어?');
insert into question(character_id, text) VALUES (4, '왜 나에게만 이런 일이 했던 적이 있었어?');
insert into question(character_id, text) VALUES (4, '현명하게 화내는 건 어떤 모습이라고 생각해?');
insert into question(character_id, text) VALUES (4, '나를 부정적 감정으로 몰아넣은 사람이나 사건이 있었어?');
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
insert into question(character_id, text) VALUES (4, '다른 사람을 무시하며 자신을 추켜세우는 사람을 만난 적이 있어?');
insert into question(character_id, text) VALUES (4, '출발선이 다른 사람에게 화가 났던 적이 있어?');
insert into question(character_id, text) VALUES (4, '제일 재수 없는 유형의 사람은 어떤 사람이야?');
insert into question(character_id, text) VALUES (4, '데스노트에 적고 싶은 사람은?');

-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (6, '누군가에게 음식해줬던 적이 있어?');
insert into question(character_id, text) VALUES (6, '한식, 양식, 중식, 일식 중에 뭐가 제일 좋아?');
insert into question(character_id, text) VALUES (6, '제일 좋아하는 음식은 뭐야? 어떤 추억이 있어?');
insert into question(character_id, text) VALUES (6, '제일 싫어하는 음식은 뭐야? 어떤 기억이 있어?');
insert into question(character_id, text) VALUES (6, '해외여행 중 먹은 음식에 관련해서 어떤 추억이 있어?');
insert into question(character_id, text) VALUES (6, '집밥에 대해 어떤 추억이 있어?');
insert into question(character_id, text) VALUES (6, '넌 부먹이야 찍먹이야? 왜?');
insert into question(character_id, text) VALUES (6, '세계 어느 나라든지 당장 갈 수 있다면 거기서 가장 먹고 싶은 음식이 뭐야?');
insert into question(character_id, text) VALUES (6, '음식과 관련된 어떤 추억이 있어?');
insert into question(character_id, text) VALUES (6, '음식과 관련된 안 좋은 기억이 있어?');
insert into question(character_id, text) VALUES (6, '가장 좋아하는 매운 음식은 뭐야?');
insert into question(character_id, text) VALUES (6, '너는 달달한 음식 좋아해? 뭐 좋아해?');
insert into question(character_id, text) VALUES (6, '너의 최애 카페음료는 뭐야? 왜 그 음료를 선택했어?');
insert into question(character_id, text) VALUES (6, '과자나 초콜릿 등을 좋아하니? 어떤 추억이 있어?');
insert into question(character_id, text) VALUES (6, '내가 가장 자신있는 요리는?');
insert into question(character_id, text) VALUES (6, '넌 다이어트에 대해 어떻게 생각해?');
insert into question(character_id, text) VALUES (6, '제일 좋아하는 빵은? 빵에 대한 추억은?');
insert into question(character_id, text) VALUES (6, '너는 라면을 좋아해? 좋아한다면 어떤 라면을 좋아해?');
insert into question(character_id, text) VALUES (6, '오늘 뭐 먹었어?');
insert into question(character_id, text) VALUES (6, '너는 치킨을 좋아해? 어떤 날에 치킨을 주로 먹어?');
insert into question(character_id, text) VALUES (6, '길거리 음식 중에 자주 사먹는 것은?');
insert into question(character_id, text) VALUES (6, '지금 먹고 싶은 것은?');
insert into question(character_id, text) VALUES (6, '너가 싫어하는 음식은 뭐야? 어릴 때랑 비교했을 때 어떻게 변했어?');
insert into question(character_id, text) VALUES (6, '너가 좋아하는 먹방 영상은?');
insert into question(character_id, text) VALUES (6, '중국집에 가면 어떤 음식을 자주 시켜먹니?');
insert into question(character_id, text) VALUES (6, '만약 아무리 먹어도 살이 안찐다면 가장 먹고 싶은 음식들은?');
insert into question(character_id, text) VALUES (6, '단 맛과 짠 맛 중에 하나 고른다면?');
insert into question(character_id, text) VALUES (6, '어떤 디저트 좋아해?');
insert into question(character_id, text) VALUES (6, '지금까지 먹은 음식 중 가장 비싼 음식은?');
insert into question(character_id, text) VALUES (6, '너가 좋아하는 식당은 어디야?');
-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'


insert into question(character_id, text) VALUES (10, '몸이 아플 때 가장 생각나는 사람이 누구야?');
insert into question(character_id, text) VALUES (10, '생일에 받고 싶은 선물은? 누구에게 받고 싶어?');
insert into question(character_id, text) VALUES (10, '너만의 소확행 (소소하지만 확실한 행복)은?');
insert into question(character_id, text) VALUES (10, '혼자 독립해서 살면서 가장 하고 싶은 일은 뭐야?');
insert into question(character_id, text) VALUES (10, '지금까지 본 영화 중에 가장 인상 깊었던 영화는 뭐야?');
insert into question(character_id, text) VALUES (10, '지금 당장 여행을 떠날 수 있다면 어디로 가고 싶어?');
insert into question(character_id, text) VALUES (10, '인생에서 가장 재미있게 읽었던 책은 뭐야?');
insert into question(character_id, text) VALUES (10, '민트 초코 좋아해?');
insert into question(character_id, text) VALUES (10, '하루종일 침대에서 뒹굴거리면서 하고 싶은 일 첫번째는?');
insert into question(character_id, text) VALUES (10, '친구들이랑 지금 당장 하고 싶은 일은 뭐야?');
insert into question(character_id, text) VALUES (10, '가장 좋아하는 아이스크림 맛은?');
insert into question(character_id, text) VALUES (10, '네가 가장 싫어하는 곤충은?');
insert into question(character_id, text) VALUES (10, '비나 눈 오는 걸 보면 드는 생각은?');
insert into question(character_id, text) VALUES (10, '네가 생각하는 최고의 크리스마스는?');
insert into question(character_id, text) VALUES (10, '가장 좋아하는 계절은?');
insert into question(character_id, text) VALUES (10, '고생한 나에게 작은 선물을 한다면 뭘 선물하고 싶어?');
insert into question(character_id, text) VALUES (10, '경치 좋은 곳에 가서 가장 하고 싶은 일이 뭐야?');
insert into question(character_id, text) VALUES (10, '집 인테리어를 하나 바꾼다면 가장 바꾸고 싶은 것은?');
insert into question(character_id, text) VALUES (10, '내 방에 있는 것들 중에 가장 좋아하는 것은?');
insert into question(character_id, text) VALUES (10, '가장 좋아하는 동물이 뭐야?');
insert into question(character_id, text) VALUES (10, '오늘 하늘은 어땠어?');
insert into question(character_id, text) VALUES (10, '가장 안 들킬 것 같은 비상금 위치는 어딜까?');
insert into question(character_id, text) VALUES (10, '여름에 뜨거운 물로 샤워하니?');
insert into question(character_id, text) VALUES (10, '네가 여러 명이라면, 어떤 일들을 할 것 같아?');
insert into question(character_id, text) VALUES (10, '네가 생각하는 가장 힐링 되는 상황은?');
insert into question(character_id, text) VALUES (10, '난 오늘 16시간 잤다~ 넌 오늘 얼마나 잤어?');
insert into question(character_id, text) VALUES (10, '스마트폰에서 네가 자주 사용하는 앱은 뭐야?');
insert into question(character_id, text) VALUES (10, '오늘 뭐 입었어? 그 옷 입은 이유가 뭐야?');
insert into question(character_id, text) VALUES (10, '넌 어떤 환경에서 잘 자?');
insert into question(character_id, text) VALUES (10, '오늘 너에게 있었던 가장 인상적인 일은?');


-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'
insert into question(character_id, text) VALUES (5, '초능력이 한 가지 생긴다면, 가장 가지고 싶은 초능력은?');
insert into question(character_id, text) VALUES (5, '로또 1등 당첨되면 가장 먼저 뭐 할 거야?');
insert into question(character_id, text) VALUES (5, '다른 사람의 생각을 읽을 수 있다면 누구의 속마음을 읽고 싶어?');
insert into question(character_id, text) VALUES (5, '만화(웹툰) 주인공이 될 수 있다면 어떤 만화의 주인공이 되고 싶어?');
insert into question(character_id, text) VALUES (5, '네가 해리포터의 등장인물이 된다면 가장 하고 싶은 마법은?');
insert into question(character_id, text) VALUES (5, '과거의 너를 만난다면 가장 전해주고 싶은 말은?');
insert into question(character_id, text) VALUES (5, '과거로 가서 역사를 바꿀 수 있다면 가장 바꾸고 싶은 역사는?');
insert into question(character_id, text) VALUES (5, '딱 한 번 미래로 갈 수 있다면 몇 년 후 미래를 보고 싶니?');
insert into question(character_id, text) VALUES (5, '외계 행성에 가서 외계인을 만난다면 가장 하고 싶은 일은?');
insert into question(character_id, text) VALUES (5, '과거의 사람과 식사를 할 수 있다면 가장 만나고 싶은 사람은?');
insert into question(character_id, text) VALUES (5, '아무리 먹어도 살이 안 찐다면 무슨 음식을 먹고 싶어?');
insert into question(character_id, text) VALUES (5, '하루 동안 원하는 직업으로 일할 수 있다면 뭘 할래?');
insert into question(character_id, text) VALUES (5, '어느 나라도 10초 만에 이동할 수 있다면 너의 여행 계획은?');
insert into question(character_id, text) VALUES (5, '네가 세계정복을 하면 가장 하고 싶은 일은?');
insert into question(character_id, text) VALUES (5, '동물이 된다면 가장되고 싶은 동물은?');
insert into question(character_id, text) VALUES (5, '나를 위한 법을 만든다면?');
insert into question(character_id, text) VALUES (5, '네가 유명인이 된다면 어떤 삶을 살까? 무엇으로 유명해진 걸까?');
insert into question(character_id, text) VALUES (5, '세계 3차 대전이 일어나다면, 네가 가장 먼저 할 일은?');
insert into question(character_id, text) VALUES (5, '너가 여러 명이라면 어떤 일들을 할 것 같아?');
insert into question(character_id, text) VALUES (5, '200살까지 살 수 있다면 너의 인생 계획은?');
insert into question(character_id, text) VALUES (5, '무인도에 너 혼자 살아남는다면? 너의 생존 계획은?');
insert into question(character_id, text) VALUES (5, '인류가 화성에서 살게 된다면 너의 직업은 무엇일 것 같아?');
insert into question(character_id, text) VALUES (5, '영화나 드라마 주인공이 될 수 있다면 어떤 주인공이 되고 싶어?');
insert into question(character_id, text) VALUES (5, '네가 날씨를 조종할 수 있다면 내일의 날씨는?');
insert into question(character_id, text) VALUES (5, '사람이 잠을 안 자고도 살 수 있다면 밤에 뭘 하고 싶어?');
insert into question(character_id, text) VALUES (5, '앞으로 100년 후의 미래는 어떤 모습일까?');
insert into question(character_id, text) VALUES (5, '동물들의 말을 알아들을 수 있다면 무슨 대화를 어떤 동물과 하고 싶어?');
insert into question(character_id, text) VALUES (5, '세계 최고의 천재가 된다면 하고 싶은 일은?');
insert into question(character_id, text) VALUES (5, '거짓말을 못 하게 된다면?');
insert into question(character_id, text) VALUES (5, '네가 구글 회장이 된다면 가장 하고 싶은 일은?');

-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (9, '새해에 해돋이를 보면서 다짐하고 싶은 목표는?');
insert into question(character_id, text) VALUES (9, '운동은 하고 있어? 얼마나? 어떻게?');
insert into question(character_id, text) VALUES (9, '오늘 계획한 일은 잘 했니? 얼마나 계획한 대로 성취했니?');
insert into question(character_id, text) VALUES (9, '오늘 방 청소는 했니? 청소는 자주 하는 편이야?');
insert into question(character_id, text) VALUES (9, '남의 눈치를 본 경험이 있어? 너는 그 경험이 좋았어?');
insert into question(character_id, text) VALUES (9, '과거에 노력을 좀 더 했다면 지금 너의 모습은 어땠을까?');
insert into question(character_id, text) VALUES (9, '남들이 생각하는 너의 모습과 네가 생각하는 너의 모습에 차이는?');
insert into question(character_id, text) VALUES (9, '저축을 매달 100만 원씩 할 수 있다면 10년 후에 너의 모습은 어떨까?');
insert into question(character_id, text) VALUES (9, '살면서 정말 열심히 해본 일이 있어?');
insert into question(character_id, text) VALUES (9, '다른 사람의 의견 말고 너의 생각대로만 했던 일이 있어?');
insert into question(character_id, text) VALUES (9, '너도 못하는 일을 남에게 강요한 적이 있어?');
insert into question(character_id, text) VALUES (9, '가장 기억에 남았던 효도는?');
insert into question(character_id, text) VALUES (9, '난 요즘 책을 읽으며 수련하고 있지. 오늘 너는 무엇을 배웠니?');
insert into question(character_id, text) VALUES (9, '너의 장점과 단점은 뭐라고 생각해?');
insert into question(character_id, text) VALUES (9, '남들보다 못하는 일이 있어?');
insert into question(character_id, text) VALUES (9, '최근에 가장 화났던 일은 뭐야? 그 일이 왜 일어난 것 같아?');
insert into question(character_id, text) VALUES (9, '너는 다른 사람의 말을 잘 들어주는 사람이니?');
insert into question(character_id, text) VALUES (9, '지금 가장 무거운 고민은 뭐야? 해결 방법은 생각했니?');
insert into question(character_id, text) VALUES (9, '하겠다고 말만 하고 시작도 못한 일이 있니?');
insert into question(character_id, text) VALUES (9, '가장 도전적이었던 일이 뭐야?');
insert into question(character_id, text) VALUES (9, '내일은 오늘의 나와 어떻게 다를까?');
insert into question(character_id, text) VALUES (9, '가장 존경하는 사람은? 그 사람과 너의 차이가 뭐라고 생각해?');
insert into question(character_id, text) VALUES (9, '순간의 실수로 일을 망친 경험이 있어?');
insert into question(character_id, text) VALUES (9, '잔소리와 조언의 차이는 뭐라고 생각해?');
insert into question(character_id, text) VALUES (9, '오늘의 삶은 만족스러웠니? 어떻게 해야 내일은 더 만족스러울 수 있을까?');
insert into question(character_id, text) VALUES (9, '앞으로 도전하고 싶은 일이 있어?');
insert into question(character_id, text) VALUES (9, '넌 주변 사람에게 좋은 사람이니?');
insert into question(character_id, text) VALUES (9, '내가 다른 사람보다 더 행복하다고 느끼는 부분이 있다면?');
insert into question(character_id, text) VALUES (9, '네가 인생 명언을 만든다면 뭐라고 할래?');
insert into question(character_id, text) VALUES (9, '네 인생에서 가장 실패한 경험은? 그 경험으로 뭘 알게 되었니?');


-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'
insert into question(character_id, text) VALUES (1, '오늘 한 말 중에 가장 후회되는 말이 뭐야?');
insert into question(character_id, text) VALUES (1, '오늘 결정한 일 중에 후회됐던 것 있어?');
insert into question(character_id, text) VALUES (1, '조금만 더 놓지 않고 싶었던 일이 있었어?');
insert into question(character_id, text) VALUES (1, '내일 잘 해내지 못할 것 같은 불안한 일이 있어?');
insert into question(character_id, text) VALUES (1, '내가 상처 줬던 사람이 있어?');
insert into question(character_id, text) VALUES (1, '후회하지 않는 일은 있었어?');
insert into question(character_id, text) VALUES (1, '전혀 걱정되지 않는 일이 있다면, 이유가 뭘까?');
insert into question(character_id, text) VALUES (1, '오늘 자기 전에 계속 생각날 것 같은 일은 뭐야?');
insert into question(character_id, text) VALUES (1, '후회되는 일이 있다면, 어떻게 고쳐나갈 수 있을까?');
insert into question(character_id, text) VALUES (1, '지금 가장 신경 쓰는 일의 최악의 상황은 무엇일까?');
insert into question(character_id, text) VALUES (1, '지금 나를 불안하게 만드는 근본적인 이유는 뭘까?');
insert into question(character_id, text) VALUES (1, '항상 그립고 생각나는 사람이 있어?');
insert into question(character_id, text) VALUES (1, '책임이 막중한 일을 맡은 적이 있어?');
insert into question(character_id, text) VALUES (1, '더 잘할 수 있었을 텐데 라고 생각되는 일이 있어?');
insert into question(character_id, text) VALUES (1, '신경 쓰이고 걱정되는 사람이 있었어?');
insert into question(character_id, text) VALUES (1, '미련과 여지를 남겨서 힘들었던 적이 있어?');
insert into question(character_id, text) VALUES (1, '과거의 일 때문에 아직 망설여지는 일이 있다면?');
insert into question(character_id, text) VALUES (1, '인생에서 가장 걱정되는 일이 뭐야?');
insert into question(character_id, text) VALUES (1, '가장 행복했던 시절은 어땠어?');
insert into question(character_id, text) VALUES (1, '하고 싶었지만 안 했거나 못했던 일이 있어?');
insert into question(character_id, text) VALUES (1, '나에 대한 기대 때문에 걱정되는 점이 있어?');
insert into question(character_id, text) VALUES (1, '시작하기 무서워 망설이고 있는 일이 있어?');
insert into question(character_id, text) VALUES (1, '무심코 뱉은 말에 다른 사람을 상처입힌 적이 있어?');
insert into question(character_id, text) VALUES (1, '사람에게 크게 상처받았던 기억이 있어?');
insert into question(character_id, text) VALUES (1, '선의의 행동이 안 좋은 결과로 나타난 적이 있어?');
insert into question(character_id, text) VALUES (1, '항상 저지르고 후회하는 것을 반복하는 습관이 있어?');
insert into question(character_id, text) VALUES (1, '일상적으로 가지고 있는 걱정거리가 있어?');
insert into question(character_id, text) VALUES (1, '가장 후회되는 일에서 대처를 더 잘했다면 지금과 달라졌을까?');
insert into question(character_id, text) VALUES (1, '요즘 자꾸 신경 쓰이는 일이 있어?');
insert into question(character_id, text) VALUES (1, '다른 사람들이 나에 대해 말하는 것 중에 어떤 게 가장 신경이 쓰여?');
-- 1,'뭉그리'
-- 2,'똘똘이',
-- 3,'달콩이'
-- 4,'부우'
-- 5,'상상이'
-- 6,'식타미'
-- 7,'룰루'
-- 8,'보사리'
-- 9,'팩폭이'
-- 10,'하차니'

insert into question(character_id, text) VALUES (2, '10년 후에 너의 미래계획은?');
insert into question(character_id, text) VALUES (2, '너는 노후에 어떻게 살고 있을 것 같아?');
insert into question(character_id, text) VALUES (2, '지금 가장 힘든 게 뭐야? 어떻게 극복 할 예정이야?');
insert into question(character_id, text) VALUES (2, '1년 후 너의 미래 계획은?');
insert into question(character_id, text) VALUES (2, '돈 모아서 가장 사고 싶은 게 뭐야?');
insert into question(character_id, text) VALUES (2, '미래에 제 2의 직업을 가진다면?');
insert into question(character_id, text) VALUES (2, '5년 후 너의 미래 계획은?');
insert into question(character_id, text) VALUES (2, '100살에 나는 어떻게 살고 있을까?');
insert into question(character_id, text) VALUES (2, '너가 생각하는 행복한 삶은 뭐야?');
insert into question(character_id, text) VALUES (2, '너의 인생 계획은 어떻게 돼?');
insert into question(character_id, text) VALUES (2, '결혼에 대해서 어떻게 생각해?');
insert into question(character_id, text) VALUES (2, '너는 돈이 생기면 어떻게 관리해?');
insert into question(character_id, text) VALUES (2, '너가 생각하는 성공한 삶은 뭐야?');
insert into question(character_id, text) VALUES (2, '내가 용돈을 버는 특별한 방법이 있다면?');
insert into question(character_id, text) VALUES (2, '휴식을 위해 계획해놓은 시간이 있어?');
insert into question(character_id, text) VALUES (2, '너가 가장 관심있는 분야는 뭐야?"');
insert into question(character_id, text) VALUES (2, '계획은 세세하게 하는 편이야?');
insert into question(character_id, text) VALUES (2, '일이 계획대로 되지 않을 때 어떻게 해왔어?');
insert into question(character_id, text) VALUES (2, '미래를 위해 현재의 나에게 가장 필요한 것은?');
insert into question(character_id, text) VALUES (2, '하루를 시작할 때 가장 먼저 하는 일은?');
insert into question(character_id, text) VALUES (2, '다른 사람에게 가장 알려주고 싶은 너의 계획 습관이 있어?');
insert into question(character_id, text) VALUES (2, '부모님에게 가장 해드리고 싶은 효도는 뭐야?');
insert into question(character_id, text) VALUES (2, '가장 만들고 싶은 습관은 뭐야?');
insert into question(character_id, text) VALUES (2, '죽기 전에 가장 이루고 싶은 일이 있어?');
insert into question(character_id, text) VALUES (2, '지피지기 백전백승! 너에 대해 알아보는 시간을 가져보자.');
insert into question(character_id, text) VALUES (2, '목표를 달성하기 위해 해야 되는 일을 우선순위로 세워보자.');
insert into question(character_id, text) VALUES (2, '너의 목표를 이루기 위해 바꿔야 할 주변 환경이 뭐가 있을까?');
insert into question(character_id, text) VALUES (2, '장기적으로 뭔가를 이루기 위해 어떤 노력을 해봤어?');
insert into question(character_id, text) VALUES (2, '건강한 삶을 살기 위해 어떤 노력을 하고 있어?');
insert into question(character_id, text) VALUES (2, '미래를 준비하기 위해 하고 있는 자기 개발이 있어?');
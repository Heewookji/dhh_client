import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/sql/character_sql.dart';
import 'package:dhh_client/sql/home_sql.dart';
import 'package:flutter/cupertino.dart';

class CharactersProvider with ChangeNotifier {
  List<Character> _characters = [];
  List<Character> get characters => [..._characters];
  List<int> get characterIds => characters.map((c) => c.id).toList();

  Future<void> setHomeCharacters() async {
    final homeData = await HomeSql.getHomeData();
    final modifiedAt = homeData[0]['modified_at'] == null
        ? null
        : DateTime.parse(homeData[0]['modified_at']);
    if (modifiedAt.day != DateTime.now().day) {
      final idMapList = await CharacterSql.getHomeRandomIds();
      await HomeSql.updateHomeLocation(idMapList);
    }
    final dataMapList = await CharacterSql.getHomeCharacters();
    _characters = dataMapList.map((dataMap) {
      return standardSerializers.deserializeWith(Character.serializer, dataMap);
    }).toList();
    notifyListeners();
  }

  Future<void> setAllCharacters() async {
    final dataMapList = await CharacterSql.getAllCharacters();
    _characters = dataMapList.map((dataMap) {
      return standardSerializers.deserializeWith(Character.serializer, dataMap);
    }).toList();
    notifyListeners();
  }

  Future<Map<String, Object>> setNewCharacterIfPossible(int diaryCount) async {
    return await CharacterSql.setNewCharacterIfPossible(diaryCount);
  }
}

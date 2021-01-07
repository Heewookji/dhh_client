import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class CharactersProvider with ChangeNotifier {
  static const TRAVEL_STATUS = 3;
  static const FULL_HOME_CHARACTER = 8;
  List<Character> _characters = [];
  List<Character> get characters => [..._characters];
  List<int> get characterIds => characters.map((c) => c.id).toList();

  Future<void> setHomeCharacters() async {
    final dataMapList = await DbService.getHomeCharacters();
    _characters = dataMapList.map((dataMap) {
      return standardSerializers.deserializeWith(Character.serializer, dataMap);
    }).toList();
    notifyListeners();
  }

  Future<void> setAllCharacters() async {
    final dataMapList = await DbService.getAllCharacters();
    _characters = dataMapList.map((dataMap) {
      return standardSerializers.deserializeWith(Character.serializer, dataMap);
    }).toList();
    notifyListeners();
  }

  Future<int> updateCharacterByDiaryCount(
      int characterId, int statusCode) async {
    final characterDiaries =
        await DbService.getDiariesByCharacterId(characterId);
    if (characterDiaries.length == 0 || characterDiaries.length % 5 != 0)
      return -1;
    final result =
        await DbService.updateStatus('status', characterId, statusCode);
    if (statusCode >= TRAVEL_STATUS) {
      await DbService.updateById(
        'character',
        {'is_home': 0, 'is_travel': 1},
        characterId,
      );
      await DbService.updateRandomCharacterHome(travelCharacterId: characterId);
    }
    await setHomeCharacters();
    return result;
  }

  Future<int> updateRandomCharacterHome() async {
    final homeCharacters = await DbService.getHomeCharacters();
    if (homeCharacters.length == FULL_HOME_CHARACTER) return -1;
    final result = await DbService.updateRandomCharacterHome();
    await setHomeCharacters();
    return result;
  }
}

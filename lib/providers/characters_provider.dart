import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class CharactersProvider with ChangeNotifier {
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
    if (statusCode >= 3) {}
    await setHomeCharacters();
    return result;
  }

  Future<int> updateRandomCharacterHome({int traveledCharacterId}) async {
    final homeCharacters = await DbService.getHomeCharacters();
    if (homeCharacters.length == 8) {
      return -1;
    } else if (homeCharacters.length == 7) {
      final result = await DbService.updateRandomCharacterHome(
        traveledCharacterId: traveledCharacterId,
      );
      await setHomeCharacters();
      return result;
    }
    return -1;
  }
}

import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class CharactersProvider with ChangeNotifier {
  static const TRAVEL_STATUS = 3;
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

  Future<Map<String, bool>> updateCharacterByDiaryCount(
      bool isFirstSubmit, Character character) async {
    final result = {
      'isFirstSubmit': isFirstSubmit,
      'updateStatus': false,
      'traveled': false,
      'newCharacter': false,
    };
    if (isFirstSubmit) {
      await DbService.updateRandomCharacterHome();
      await setHomeCharacters();
      return result;
    }
    final characterDiaries =
        await DbService.getDiariesByCharacterId(character.id);
    if (characterDiaries.length % 5 != 0) return result;
    result['updateStatus'] =
        await DbService.updateStatus(character.id, character.statusCode) == 1;
    if (result['updateStatus'] && character.statusCode >= TRAVEL_STATUS) {
      result['traveled'] = await DbService.updateById(
            'character',
            {'is_home': 0, 'is_travel': 1},
            character.id,
          ) ==
          1;
    }
    if (result['traveled']) {
      result['newCharacter'] = await DbService.updateRandomCharacterHome(
            avoidCharacterId: character.id,
          ) ==
          1;
    }
    await setHomeCharacters();
    return result;
  }
}

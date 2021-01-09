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
    final homeData = await DbService.getData('home');
    final modifiedAt = homeData[0]['modified_at'] == null
        ? null
        : DateTime.parse(homeData[0]['modified_at']);
    if (modifiedAt.day != DateTime.now().day) {
      final idMapList = await DbService.getHomeRandomIds();
      await DbService.updateHomeLocation(idMapList);
      await DbService.updateHomeModifiedAt();
    }
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

  Future<Map<String, Object>> updateCharacterByDiaryCount(
      bool isFirstSubmit, Character character) async {
    final Map<String, Object> result = {
      'isFirstSubmit': isFirstSubmit,
      'updateStatus': false,
      'traveled': false,
      'newCharacter': null,
    };
    if (isFirstSubmit) {
      final dataMap = await DbService.setRandomCharacterAtHome();
      result['newCharacter'] =
          standardSerializers.deserializeWith(Character.serializer, dataMap);
      await setHomeCharacters();
      return result;
    }
    final characterDiaries =
        await DbService.getDiariesByCharacterId(character.id);
    if (characterDiaries.length % 5 != 0) return result;
    result['updateStatus'] =
        await DbService.updateStatus(character.id, character.statusCode) == 1;
    if (result['updateStatus'] && character.statusCode >= TRAVEL_STATUS) {
      result['traveled'] =
          await DbService.setCharacterAtTravelById(character.id) == 1;
    }
    if (result['traveled']) {
      final dataMap = await DbService.setRandomCharacterAtHome(
          avoidCharacterId: character.id);
      result['newCharacter'] =
          standardSerializers.deserializeWith(Character.serializer, dataMap);
    }
    await setHomeCharacters();
    return result;
  }
}

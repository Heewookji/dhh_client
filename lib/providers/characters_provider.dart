import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class CharactersProvider with ChangeNotifier {
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
      final dataMap = await DbService.getHomeRandomCharacter();
      await DbService.setCharacterAtHomeById(dataMap['id']);
      result['newCharacter'] =
          standardSerializers.deserializeWith(Character.serializer, dataMap);
      await setHomeCharacters();
      return result;
    }
    final characterDiaries =
        await DbService.getDiariesByCharacterId(character.id);
    if (characterDiaries.length % Constants.DIARY_STATUS_COUNT != 0)
      return result;
    if (character.statusCode < Constants.FINAL_STATUS) {
      result['updateStatus'] =
          await DbService.updateStatus(character.id, character.statusCode) == 1;
    }
    if (character.statusCode >= Constants.TRAVEL_STATUS) {
      result['traveled'] =
          await DbService.setCharacterAtTravelById(character.id) == 1;
    }
    if (result['traveled']) {
      final dataMap = await DbService.getHomeRandomCharacter(
          avoidCharacterId: character.id);
      if (dataMap != null) {
        await DbService.setCharacterAtHomeById(dataMap['id']);
        result['newCharacter'] =
            standardSerializers.deserializeWith(Character.serializer, dataMap);
      }
    }
    await setHomeCharacters();
    return result;
  }
}

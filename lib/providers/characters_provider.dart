import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class CharactersProvider with ChangeNotifier {
  List<Character> _characters = [];
  List<Character> get characters {
    return [..._characters];
  }

  Future<void> setCharacters() async {
    final dataMapList = await DbService.getHomeCharacters();
    _characters = dataMapList.map((dataMap) {
      return standardSerializers.deserializeWith(Character.serializer, dataMap);
    }).toList();
    notifyListeners();
  }

  void insertCharacter() async {
    DbService.insert(
        'character',
        standardSerializers.serializeWith(
            Character.serializer,
            Character((b) => b
              ..name = 'test'
              ..isHome = 0
              ..isStarter = 0
              ..isTravel = 0)));
  }
}

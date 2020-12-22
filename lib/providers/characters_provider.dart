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
    final dataList = await DbService.getData('character');
    print(dataList);
    _characters = dataList
        .map((dataMap) => serializers.deserialize(dataMap) as Character)
        .toList();
    notifyListeners();
  }

  void insertCharacter() async {
    DbService.insert('character', {
      'name': 'test',
      'is_starter': 0,
      'is_home': 0,
      'is_travel': 0,
    });
  }
}

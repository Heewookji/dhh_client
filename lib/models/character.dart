import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character.g.dart';

abstract class Character implements Built<Character, CharacterBuilder> {
  static Serializer<Character> get serializer => _$characterSerializer;
  int get id;
  String get name;
  @nullable
  String get description;
  @BuiltValueField(wireName: 'is_home')
  bool get isHome;
  @BuiltValueField(wireName: 'is_travel')
  bool get isTravel;
  @BuiltValueField(wireName: 'is_starter')
  bool get isStarter;

  Character._();
  factory Character([void Function(CharacterBuilder) updates]) = _$Character;
}

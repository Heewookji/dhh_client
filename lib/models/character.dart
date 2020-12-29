import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character.g.dart';

abstract class Character implements Built<Character, CharacterBuilder> {
  static Serializer<Character> get serializer => _$characterSerializer;
  @nullable
  int get id;
  String get name;
  @nullable
  String get description;
  @BuiltValueField(wireName: 'is_home')
  int get isHome;
  @BuiltValueField(wireName: 'is_travel')
  int get isTravel;
  @BuiltValueField(wireName: 'is_starter')
  int get isStarter;
  @BuiltValueField(wireName: 'code')
  int get statusCode;
  @BuiltValueField(wireName: 'image_url')
  String get statusImageUrl;
  int get color;

  Character._();
  factory Character([void Function(CharacterBuilder) updates]) = _$Character;
}

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'character.g.dart';

abstract class Character implements Built<Character, CharacterBuilder> {
  static Serializer<Character> get serializer => _$characterSerializer;
  @nullable
  int get id;
  String get name;
  int get color;
  @nullable
  String get description;
  @nullable
  @BuiltValueField(wireName: 'is_home')
  int get isHome;
  @nullable
  @BuiltValueField(wireName: 'is_travel')
  int get isTravel;
  @BuiltValueField(wireName: 'code')
  int get statusCode;
  @BuiltValueField(wireName: 'image_url')
  String get statusImageUrl;

  Character._();
  factory Character([void Function(CharacterBuilder) updates]) = _$Character;
}

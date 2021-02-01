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
  @BuiltValueField(wireName: 'face_url')
  String get faceUrl;
  @nullable
  @BuiltValueField(wireName: 'is_home')
  int get isHome;
  @nullable
  @BuiltValueField(wireName: 'is_travel')
  int get isTravel;
  @nullable
  @BuiltValueField(wireName: 'location_id')
  int get locationId;
  @BuiltValueField(wireName: 'code')
  int get statusCode;
  @BuiltValueField(wireName: 'image_url')
  String get statusImageUrl;

  Character._();
  factory Character([void Function(CharacterBuilder) updates]) = _$Character;
}

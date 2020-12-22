import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'status.g.dart';

abstract class Status implements Built<Status, StatusBuilder> {
  static Serializer<Status> get serializer => _$statusSerializer;
  @nullable
  int get code;
  @BuiltValueField(wireName: 'character_id')
  int get characterId;
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;
  @nullable
  String get description;
  @BuiltValueField(wireName: 'is_status_now')
  bool get isStatusNow;

  Status._();
  factory Status([void Function(StatusBuilder) updates]) = _$Status;
}

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'diary.g.dart';

abstract class Diary implements Built<Diary, DiaryBuilder> {
  static Serializer<Diary> get serializer => _$diarySerializer;
  @nullable
  int get id;
  @BuiltValueField(wireName: 'question_id')
  int get questionId;
  String get text;
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;
  @nullable
  int get color;

  Diary._();
  factory Diary([void Function(DiaryBuilder) updates]) = _$Diary;
}

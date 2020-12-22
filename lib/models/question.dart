import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'question.g.dart';

abstract class Question implements Built<Question, QuestionBuilder> {
  static Serializer<Question> get serializer => _$questionSerializer;
  @nullable
  int get id;
  @BuiltValueField(wireName: 'character_id')
  int get characterId;
  String get text;

  Question._();
  factory Question([void Function(QuestionBuilder) updates]) = _$Question;
}

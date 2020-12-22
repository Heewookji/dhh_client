// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Question> _$questionSerializer = new _$QuestionSerializer();

class _$QuestionSerializer implements StructuredSerializer<Question> {
  @override
  final Iterable<Type> types = const [Question, _$Question];
  @override
  final String wireName = 'Question';

  @override
  Iterable<Object> serialize(Serializers serializers, Question object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'character_id',
      serializers.serialize(object.characterId,
          specifiedType: const FullType(int)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Question deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'character_id':
          result.characterId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Question extends Question {
  @override
  final int id;
  @override
  final int characterId;
  @override
  final String text;

  factory _$Question([void Function(QuestionBuilder) updates]) =>
      (new QuestionBuilder()..update(updates)).build();

  _$Question._({this.id, this.characterId, this.text}) : super._() {
    if (characterId == null) {
      throw new BuiltValueNullFieldError('Question', 'characterId');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Question', 'text');
    }
  }

  @override
  Question rebuild(void Function(QuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionBuilder toBuilder() => new QuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question &&
        id == other.id &&
        characterId == other.characterId &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), characterId.hashCode), text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Question')
          ..add('id', id)
          ..add('characterId', characterId)
          ..add('text', text))
        .toString();
  }
}

class QuestionBuilder implements Builder<Question, QuestionBuilder> {
  _$Question _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _characterId;
  int get characterId => _$this._characterId;
  set characterId(int characterId) => _$this._characterId = characterId;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  QuestionBuilder();

  QuestionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _characterId = _$v.characterId;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Question other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Question;
  }

  @override
  void update(void Function(QuestionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Question build() {
    final _$result =
        _$v ?? new _$Question._(id: id, characterId: characterId, text: text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
